# frozen_string_literal: true

require_relative "wiremock_test_case"

class OAuthWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_o_auth_token_with_wiremock
    test_id = "o_auth.token.0"

    result = @client.o_auth.token(
      grant_type: "refresh_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "o_auth.token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/token",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/expires_in" => 900
      }
    )
  end

  def test_o_auth_token_throws_bad_request_error_with_wiremock
    test_id = "o_auth.token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.o_auth.token(
        grant_type: "refresh_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/token",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_token_throws_unauthorized_error_with_wiremock
    test_id = "o_auth.token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.o_auth.token(
        grant_type: "refresh_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/token",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_token_throws_too_many_requests_error_with_wiremock
    test_id = "o_auth.token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.o_auth.token(
        grant_type: "refresh_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/token",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_token_throws_internal_server_error_with_wiremock
    test_id = "o_auth.token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.o_auth.token(
        grant_type: "refresh_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/token",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_token_throws_client_request_error_with_wiremock
    test_id = "o_auth.token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.o_auth.token(
        grant_type: "refresh_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/token",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_token_throws_server_error_with_wiremock
    test_id = "o_auth.token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.o_auth.token(
        grant_type: "refresh_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/token",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_introspect_with_wiremock
    test_id = "o_auth.introspect.0"

    result = @client.o_auth.introspect(
      token: "token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "o_auth.introspect.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/introspect",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/exp" => 1670000000,
        "/iat" => 1670000000
      }
    )
  end

  def test_o_auth_introspect_throws_bad_request_error_with_wiremock
    test_id = "o_auth.introspect.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.o_auth.introspect(
        token: "token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.introspect.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/introspect",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_introspect_throws_unauthorized_error_with_wiremock
    test_id = "o_auth.introspect.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.o_auth.introspect(
        token: "token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.introspect.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/introspect",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_introspect_throws_too_many_requests_error_with_wiremock
    test_id = "o_auth.introspect.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.o_auth.introspect(
        token: "token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.introspect.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/introspect",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_introspect_throws_internal_server_error_with_wiremock
    test_id = "o_auth.introspect.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.o_auth.introspect(
        token: "token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.introspect.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/introspect",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_introspect_throws_client_request_error_with_wiremock
    test_id = "o_auth.introspect.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.o_auth.introspect(
        token: "token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.introspect.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/introspect",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_introspect_throws_server_error_with_wiremock
    test_id = "o_auth.introspect.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.o_auth.introspect(
        token: "token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.introspect.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/introspect",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_revoke_with_wiremock
    test_id = "o_auth.revoke.0"

    @client.o_auth.revoke(
      token: "token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "o_auth.revoke.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_revoke_throws_bad_request_error_with_wiremock
    test_id = "o_auth.revoke.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.o_auth.revoke(
        token: "token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.revoke.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_revoke_throws_unauthorized_error_with_wiremock
    test_id = "o_auth.revoke.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.o_auth.revoke(
        token: "token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.revoke.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_revoke_throws_too_many_requests_error_with_wiremock
    test_id = "o_auth.revoke.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.o_auth.revoke(
        token: "token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.revoke.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_revoke_throws_internal_server_error_with_wiremock
    test_id = "o_auth.revoke.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.o_auth.revoke(
        token: "token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.revoke.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_revoke_throws_client_request_error_with_wiremock
    test_id = "o_auth.revoke.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.o_auth.revoke(
        token: "token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.revoke.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_o_auth_revoke_throws_server_error_with_wiremock
    test_id = "o_auth.revoke.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.o_auth.revoke(
        token: "token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "o_auth.revoke.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/oauth/revoke",
      query_params: nil,
      expected: 1
    )
  end
end
