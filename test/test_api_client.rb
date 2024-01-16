require 'faraday'
require 'faraday/multipart'

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
end
