# frozen_string_literal: true

require_relative "wiremock_test_case"

class AuthWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_auth_get_with_wiremock
    test_id = "auth.get.0"

    result = @client.auth.get(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "auth.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/balances/available" => 100,
        "/accounts/0/balances/current" => 110,
        "/accounts/0/apy" => 0
      }
    )
  end

  def test_auth_get_throws_bad_request_error_with_wiremock
    test_id = "auth.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.auth.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "auth.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_auth_get_throws_unauthorized_error_with_wiremock
    test_id = "auth.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.auth.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "auth.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_auth_get_throws_too_many_requests_error_with_wiremock
    test_id = "auth.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.auth.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "auth.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_auth_get_throws_internal_server_error_with_wiremock
    test_id = "auth.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.auth.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "auth.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_auth_get_throws_client_request_error_with_wiremock
    test_id = "auth.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.auth.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "auth.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_auth_get_throws_server_error_with_wiremock
    test_id = "auth.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.auth.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "auth.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_auth_verify_with_wiremock
    test_id = "auth.verify.0"

    result = @client.auth.verify(
      numbers: {
        ach: {
          account: "account",
          routing: "routing"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "auth.verify.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/verify",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/verification_insights/name_match_score" => 85
      }
    )
  end

  def test_auth_verify_throws_bad_request_error_with_wiremock
    test_id = "auth.verify.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.auth.verify(
        numbers: {
          ach: {
            account: "account",
            routing: "routing"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "auth.verify.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/verify",
      query_params: nil,
      expected: 1
    )
  end

  def test_auth_verify_throws_unauthorized_error_with_wiremock
    test_id = "auth.verify.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.auth.verify(
        numbers: {
          ach: {
            account: "account",
            routing: "routing"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "auth.verify.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/verify",
      query_params: nil,
      expected: 1
    )
  end

  def test_auth_verify_throws_too_many_requests_error_with_wiremock
    test_id = "auth.verify.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.auth.verify(
        numbers: {
          ach: {
            account: "account",
            routing: "routing"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "auth.verify.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/verify",
      query_params: nil,
      expected: 1
    )
  end

  def test_auth_verify_throws_internal_server_error_with_wiremock
    test_id = "auth.verify.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.auth.verify(
        numbers: {
          ach: {
            account: "account",
            routing: "routing"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "auth.verify.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/verify",
      query_params: nil,
      expected: 1
    )
  end

  def test_auth_verify_throws_client_request_error_with_wiremock
    test_id = "auth.verify.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.auth.verify(
        numbers: {
          ach: {
            account: "account",
            routing: "routing"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "auth.verify.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/verify",
      query_params: nil,
      expected: 1
    )
  end

  def test_auth_verify_throws_server_error_with_wiremock
    test_id = "auth.verify.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.auth.verify(
        numbers: {
          ach: {
            account: "account",
            routing: "routing"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "auth.verify.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/auth/verify",
      query_params: nil,
      expected: 1
    )
  end
end
