# frozen_string_literal: true

require_relative "wiremock_test_case"

class TransferCapabilitiesWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_transfer_capabilities_get_with_wiremock
    test_id = "transfer.capabilities.get.0"

    @client.transfer.capabilities.get(
      access_token: "access_token",
      account_id: "account_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.capabilities.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/capabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_capabilities_get_throws_bad_request_error_with_wiremock
    test_id = "transfer.capabilities.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.capabilities.get(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.capabilities.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/capabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_capabilities_get_throws_unauthorized_error_with_wiremock
    test_id = "transfer.capabilities.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.capabilities.get(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.capabilities.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/capabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_capabilities_get_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.capabilities.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.capabilities.get(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.capabilities.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/capabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_capabilities_get_throws_internal_server_error_with_wiremock
    test_id = "transfer.capabilities.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.capabilities.get(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.capabilities.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/capabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_capabilities_get_throws_client_request_error_with_wiremock
    test_id = "transfer.capabilities.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.capabilities.get(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.capabilities.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/capabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_capabilities_get_throws_server_error_with_wiremock
    test_id = "transfer.capabilities.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.capabilities.get(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.capabilities.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/capabilities/get",
      query_params: nil,
      expected: 1
    )
  end
end
