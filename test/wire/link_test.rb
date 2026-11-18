# frozen_string_literal: true

require_relative "wiremock_test_case"

class LinkWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_link_create_token_with_wiremock
    test_id = "link.create_token.0"

    @client.link.create_token(
      client_name: "client_name",
      language: "language",
      country_codes: ["US"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "link.create_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_create_token_throws_bad_request_error_with_wiremock
    test_id = "link.create_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.link.create_token(
        client_name: "x",
        language: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.create_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_create_token_throws_unauthorized_error_with_wiremock
    test_id = "link.create_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.link.create_token(
        client_name: "x",
        language: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.create_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_create_token_throws_too_many_requests_error_with_wiremock
    test_id = "link.create_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.link.create_token(
        client_name: "x",
        language: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.create_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_create_token_throws_internal_server_error_with_wiremock
    test_id = "link.create_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.link.create_token(
        client_name: "x",
        language: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.create_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_create_token_throws_client_request_error_with_wiremock
    test_id = "link.create_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.link.create_token(
        client_name: "x",
        language: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.create_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_create_token_throws_server_error_with_wiremock
    test_id = "link.create_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.link.create_token(
        client_name: "x",
        language: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.create_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_get_token_with_wiremock
    test_id = "link.get_token.0"

    result = @client.link.get_token(
      link_token: "link_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "link.get_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/link_sessions/0/results/payroll_income_results/0/num_paystubs_retrieved" => 1,
        "/link_sessions/0/results/payroll_income_results/0/num_w2s_retrieved" => 1
      }
    )
  end

  def test_link_get_token_throws_bad_request_error_with_wiremock
    test_id = "link.get_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.link.get_token(
        link_token: "link_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.get_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_get_token_throws_unauthorized_error_with_wiremock
    test_id = "link.get_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.link.get_token(
        link_token: "link_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.get_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_get_token_throws_too_many_requests_error_with_wiremock
    test_id = "link.get_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.link.get_token(
        link_token: "link_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.get_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_get_token_throws_internal_server_error_with_wiremock
    test_id = "link.get_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.link.get_token(
        link_token: "link_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.get_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_get_token_throws_client_request_error_with_wiremock
    test_id = "link.get_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.link.get_token(
        link_token: "link_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.get_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_get_token_throws_server_error_with_wiremock
    test_id = "link.get_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.link.get_token(
        link_token: "link_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.get_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/token/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_exchange_oauth_correlation_id_with_wiremock
    test_id = "link.exchange_oauth_correlation_id.0"

    @client.link.exchange_oauth_correlation_id(
      link_correlation_id: "link_correlation_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "link.exchange_oauth_correlation_id.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/oauth/correlation_id/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_exchange_oauth_correlation_id_throws_bad_request_error_with_wiremock
    test_id = "link.exchange_oauth_correlation_id.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.link.exchange_oauth_correlation_id(
        link_correlation_id: "link_correlation_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.exchange_oauth_correlation_id.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/oauth/correlation_id/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_exchange_oauth_correlation_id_throws_unauthorized_error_with_wiremock
    test_id = "link.exchange_oauth_correlation_id.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.link.exchange_oauth_correlation_id(
        link_correlation_id: "link_correlation_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.exchange_oauth_correlation_id.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/oauth/correlation_id/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_exchange_oauth_correlation_id_throws_too_many_requests_error_with_wiremock
    test_id = "link.exchange_oauth_correlation_id.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.link.exchange_oauth_correlation_id(
        link_correlation_id: "link_correlation_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.exchange_oauth_correlation_id.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/oauth/correlation_id/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_exchange_oauth_correlation_id_throws_internal_server_error_with_wiremock
    test_id = "link.exchange_oauth_correlation_id.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.link.exchange_oauth_correlation_id(
        link_correlation_id: "link_correlation_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.exchange_oauth_correlation_id.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/oauth/correlation_id/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_exchange_oauth_correlation_id_throws_client_request_error_with_wiremock
    test_id = "link.exchange_oauth_correlation_id.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.link.exchange_oauth_correlation_id(
        link_correlation_id: "link_correlation_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.exchange_oauth_correlation_id.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/oauth/correlation_id/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_link_exchange_oauth_correlation_id_throws_server_error_with_wiremock
    test_id = "link.exchange_oauth_correlation_id.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.link.exchange_oauth_correlation_id(
        link_correlation_id: "link_correlation_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "link.exchange_oauth_correlation_id.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/link/oauth/correlation_id/exchange",
      query_params: nil,
      expected: 1
    )
  end
end
