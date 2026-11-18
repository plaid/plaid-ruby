# frozen_string_literal: true

require_relative "wiremock_test_case"

class SessionWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_session_create_token_with_wiremock
    test_id = "session.create_token.0"

    @client.session.create_token(
      template_id: "template_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "session.create_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/session/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_session_create_token_throws_bad_request_error_with_wiremock
    test_id = "session.create_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.session.create_token(
        template_id: "template_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "session.create_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/session/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_session_create_token_throws_unauthorized_error_with_wiremock
    test_id = "session.create_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.session.create_token(
        template_id: "template_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "session.create_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/session/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_session_create_token_throws_too_many_requests_error_with_wiremock
    test_id = "session.create_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.session.create_token(
        template_id: "template_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "session.create_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/session/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_session_create_token_throws_internal_server_error_with_wiremock
    test_id = "session.create_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.session.create_token(
        template_id: "template_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "session.create_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/session/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_session_create_token_throws_client_request_error_with_wiremock
    test_id = "session.create_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.session.create_token(
        template_id: "template_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "session.create_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/session/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_session_create_token_throws_server_error_with_wiremock
    test_id = "session.create_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.session.create_token(
        template_id: "template_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "session.create_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/session/token/create",
      query_params: nil,
      expected: 1
    )
  end
end
