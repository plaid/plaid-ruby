# frozen_string_literal: true

require_relative "wiremock_test_case"

class WebhookWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_webhook_get_verification_key_with_wiremock
    test_id = "webhook.get_verification_key.0"

    result = @client.webhook.get_verification_key(
      key_id: "key_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhook.get_verification_key.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/webhook_verification_key/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/key/created_at" => 1560466150
      }
    )
  end

  def test_webhook_get_verification_key_throws_bad_request_error_with_wiremock
    test_id = "webhook.get_verification_key.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.webhook.get_verification_key(
        key_id: "key_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "webhook.get_verification_key.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/webhook_verification_key/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhook_get_verification_key_throws_unauthorized_error_with_wiremock
    test_id = "webhook.get_verification_key.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.webhook.get_verification_key(
        key_id: "key_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "webhook.get_verification_key.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/webhook_verification_key/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhook_get_verification_key_throws_too_many_requests_error_with_wiremock
    test_id = "webhook.get_verification_key.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.webhook.get_verification_key(
        key_id: "key_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "webhook.get_verification_key.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/webhook_verification_key/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhook_get_verification_key_throws_internal_server_error_with_wiremock
    test_id = "webhook.get_verification_key.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.webhook.get_verification_key(
        key_id: "key_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "webhook.get_verification_key.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/webhook_verification_key/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhook_get_verification_key_throws_client_request_error_with_wiremock
    test_id = "webhook.get_verification_key.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.webhook.get_verification_key(
        key_id: "key_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "webhook.get_verification_key.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/webhook_verification_key/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhook_get_verification_key_throws_server_error_with_wiremock
    test_id = "webhook.get_verification_key.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.webhook.get_verification_key(
        key_id: "key_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "webhook.get_verification_key.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/webhook_verification_key/get",
      query_params: nil,
      expected: 1
    )
  end
end
