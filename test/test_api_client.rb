require 'faraday'
require 'faraday/multipart'
require 'timeout'
require 'tmpdir'


require_relative "test_helper"

# Internal: The test for API Client
class ApiClientTest < PlaidTest
  def test_api_client_exposes_farday_connection
    configuration = Plaid::Configuration.new
    configuration.server_index = Plaid::Configuration::Environment["sandbox"]
    configuration.timeout = NETWORK_TIMEOUT
    configuration.api_key["PLAID-CLIENT-ID"] = ENV["PLAID_RUBY_CLIENT_ID"]
    configuration.api_key["PLAID-SECRET"] = ENV["PLAID_RUBY_SECRET"]
    configuration.api_key["Plaid-Version"] = "2020-09-14"

    api_client = Plaid::ApiClient.new(
      configuration
    )

    assert_kind_of(Faraday::Connection, api_client.connection)
  end
  def test_timeout_error
    api_client = Plaid::ApiClient.new
    exception = -> { raise Faraday::TimeoutError.new }
    options = { header_params: {} }

    error = assert_raises Plaid::ApiClient::ApiTimeoutError do
      api_client.connection.stub :get, exception do
        api_client.call_api(:get, 'dummy_path', options)
      end
    end

    assert_equal 'Connection timed out', error.message
  end

  def test_connection_error
    api_client = Plaid::ApiClient.new
    exception = -> { raise Faraday::ConnectionFailed.new }
    options = { header_params: {} }

    error = assert_raises Plaid::ApiClient::ApiConnectionFailedError do
      api_client.connection.stub :get, exception do
        api_client.call_api(:get, 'dummy_path', options)
      end
    end

    assert_equal 'Connection failed', error.message
  end

  def test_concurrent_file_downloads_return_their_own_response
    Dir.mktmpdir do |temp_dir|
      configuration = Plaid::Configuration.new
      configuration.temp_folder_path = temp_dir
      api_client = Plaid::ApiClient.new(configuration)
      bodies = { first: "%PDF-first\x00\xff".b, second: "%PDF-second\x00\xfe".b }
      responses = bodies.to_h do |marker, body|
        headers = { 'Content-Type' => 'application/pdf', 'Plaid-Request-ID' => marker.to_s }
        [marker, Faraday::Response.new(status: 200, body: body, response_headers: headers)]
      end
      first_file_prepared = Queue.new
      release_first = Queue.new
      threads = []
      results = {}
      options = { header_params: {}, return_type: 'File' }

      # Hold the first call after its file is written until the second call returns.
      log_file_written = lambda do |_message|
        if Thread.current[:download_marker] == :first
          first_file_prepared << true
          release_first.pop
        end
      end
      response_for_thread = -> { responses.fetch(Thread.current[:download_marker]) }

      begin
        api_client.connection.stub :get, response_for_thread do
          configuration.logger.stub :info, log_file_written do
            threads << Thread.new do
              Thread.current[:download_marker] = :first
              api_client.call_api(:get, '/first.pdf', options)
            end
            Timeout.timeout(5) { first_file_prepared.pop }
            threads << Thread.new do
              Thread.current[:download_marker] = :second
              api_client.call_api(:get, '/second.pdf', options)
            end
            results[:second] = Timeout.timeout(5) { threads.last.value }
            release_first << true
            results[:first] = Timeout.timeout(5) { threads.first.value }
          end
        end

        bodies.each do |marker, expected_body|
          file, status, headers = results.fetch(marker)
          assert_kind_of Tempfile, file
          assert file.closed?
          assert_equal expected_body, File.binread(file.path)
          assert_equal 200, status
          assert_equal 'application/pdf', headers['Content-Type']
          assert_equal marker.to_s, headers['Plaid-Request-ID']
        end
        refute_same results[:first].first, results[:second].first
        assert_equal 2, Dir.children(temp_dir).size
      ensure
        release_first << true
        threads.each do |thread|
          thread.kill if thread.alive?
          thread.join
        end
        results.each_value { |result| result.first.close! }
      end
    end
  end

  def test_generated_pdf_endpoint_returns_one_binary_file_per_call
    Dir.mktmpdir do |temp_dir|
      configuration = Plaid::Configuration.new
      configuration.temp_folder_path = temp_dir
      api_client = Plaid::ApiClient.new(configuration)
      body = "%PDF-single\x00\xff".b
      headers = { 'Content-Type' => 'application/pdf', 'Plaid-Request-ID' => 'test-pdf' }
      stubs = Faraday::Adapter::Test::Stubs.new do |stub|
        stub.post('/asset_report/pdf/get') { [200, headers, body] }
      end
      api_client.create_connection { |builder| builder.adapter :test, stubs }
      client = Plaid::PlaidApi.new(api_client)
      request = Plaid::AssetReportPDFGetRequest.new(asset_report_token: 'synthetic-token')
      files = []

      file, status, response_headers = client.asset_report_pdf_get_with_http_info(request)
      files << file
      assert_equal 200, status
      assert_equal 'test-pdf', response_headers['Plaid-Request-ID']
      files << client.asset_report_pdf_get(request)
      files.each do |download|
        assert_kind_of Tempfile, download
        assert download.closed?
        assert_equal body, File.binread(download.path)
      end
      refute_same(*files)
      assert_equal 2, Dir.children(temp_dir).size
      stubs.verify_stubbed_calls
    ensure
      files&.each(&:close!)
    end
  end

  def test_deserialize_file_preserves_empty_body_and_filename
    Dir.mktmpdir do |temp_dir|
      configuration = Plaid::Configuration.new
      configuration.temp_folder_path = temp_dir
      api_client = Plaid::ApiClient.new(configuration)
      response = Faraday::Response.new(
        status: 200,
        body: ''.b,
        response_headers: { 'Content-Disposition' => 'attachment; filename="../../report.pdf"' }
      )

      file = api_client.deserialize(response, 'File')
      assert_kind_of Tempfile, file
      assert file.closed?
      assert_equal ''.b, File.binread(file.path)
      assert_equal temp_dir, File.dirname(file.path)
      assert_match(/\Areport\.pdf-/, File.basename(file.path))
    ensure
      file.close! if file
    end
  end

  def test_call_api_preserves_non_file_response
    api_client = Plaid::ApiClient.new
    headers = { 'Content-Type' => 'application/json', 'Plaid-Request-ID' => 'test-request' }
    response = Faraday::Response.new(status: 200, body: '{"request_id":"test-request"}', response_headers: headers)

    api_client.connection.stub :get, -> { response } do
      data, status, response_headers = api_client.call_api(:get, '/test', header_params: {}, return_type: 'Object')
      assert_equal({ request_id: 'test-request' }, data)
      assert_equal 200, status
      assert_equal headers, response_headers
    end
  end
end
