# frozen_string_literal: true

require_relative "wiremock_test_case"

class NetworkWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_network_get_status_with_wiremock
    test_id = "network.get_status.0"

    @client.network.get_status(
      user: {
        phone_number: "phone_number"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "network.get_status.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/network/status/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_network_get_status_throws_bad_request_error_with_wiremock
    test_id = "network.get_status.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.network.get_status(
        user: {
          phone_number: "phone_number"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "network.get_status.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/network/status/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_network_get_status_throws_unauthorized_error_with_wiremock
    test_id = "network.get_status.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.network.get_status(
        user: {
          phone_number: "phone_number"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "network.get_status.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/network/status/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_network_get_status_throws_too_many_requests_error_with_wiremock
    test_id = "network.get_status.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.network.get_status(
        user: {
          phone_number: "phone_number"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "network.get_status.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/network/status/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_network_get_status_throws_internal_server_error_with_wiremock
    test_id = "network.get_status.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.network.get_status(
        user: {
          phone_number: "phone_number"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "network.get_status.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/network/status/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_network_get_status_throws_client_request_error_with_wiremock
    test_id = "network.get_status.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.network.get_status(
        user: {
          phone_number: "phone_number"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "network.get_status.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/network/status/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_network_get_status_throws_server_error_with_wiremock
    test_id = "network.get_status.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.network.get_status(
        user: {
          phone_number: "phone_number"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "network.get_status.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/network/status/get",
      query_params: nil,
      expected: 1
    )
  end
end
