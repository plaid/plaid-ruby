# frozen_string_literal: true

require_relative "wiremock_test_case"

class BeaconReportSyndicationWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_beacon_report_syndication_list_with_wiremock
    test_id = "beacon_report.syndication.list.0"

    result = @client.beacon_report.syndication.list(
      beacon_user_id: "becusr_42cF1MNo42r9Xj",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_report.syndication.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_list_throws_bad_request_error_with_wiremock
    test_id = "beacon_report.syndication.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_report.syndication.list(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_report.syndication.list.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_list_throws_unauthorized_error_with_wiremock
    test_id = "beacon_report.syndication.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.beacon_report.syndication.list(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_report.syndication.list.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_list_throws_too_many_requests_error_with_wiremock
    test_id = "beacon_report.syndication.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_report.syndication.list(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_report.syndication.list.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_list_throws_internal_server_error_with_wiremock
    test_id = "beacon_report.syndication.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_report.syndication.list(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_report.syndication.list.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_list_throws_client_request_error_with_wiremock
    test_id = "beacon_report.syndication.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_report.syndication.list(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_report.syndication.list.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_list_throws_server_error_with_wiremock
    test_id = "beacon_report.syndication.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_report.syndication.list(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_report.syndication.list.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_get_with_wiremock
    test_id = "beacon_report.syndication.get.0"

    @client.beacon_report.syndication.get(
      beacon_report_syndication_id: "becrsn_11111111111111",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_report.syndication.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_get_throws_bad_request_error_with_wiremock
    test_id = "beacon_report.syndication.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_report.syndication.get(
        beacon_report_syndication_id: "beacon_report_syndication_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_report.syndication.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_get_throws_unauthorized_error_with_wiremock
    test_id = "beacon_report.syndication.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.beacon_report.syndication.get(
        beacon_report_syndication_id: "beacon_report_syndication_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_report.syndication.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_get_throws_too_many_requests_error_with_wiremock
    test_id = "beacon_report.syndication.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_report.syndication.get(
        beacon_report_syndication_id: "beacon_report_syndication_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_report.syndication.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_get_throws_internal_server_error_with_wiremock
    test_id = "beacon_report.syndication.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_report.syndication.get(
        beacon_report_syndication_id: "beacon_report_syndication_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_report.syndication.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_get_throws_client_request_error_with_wiremock
    test_id = "beacon_report.syndication.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_report.syndication.get(
        beacon_report_syndication_id: "beacon_report_syndication_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_report.syndication.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_report_syndication_get_throws_server_error_with_wiremock
    test_id = "beacon_report.syndication.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_report.syndication.get(
        beacon_report_syndication_id: "beacon_report_syndication_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_report.syndication.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/report_syndication/get",
      query_params: nil,
      expected: 1
    )
  end
end
