# frozen_string_literal: true

require_relative "wiremock_test_case"

class AccountsWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_accounts_get_with_wiremock
    test_id = "accounts.get.0"

    result = @client.accounts.get(
      access_token: "string",
      options: {
        account_ids: ["string"]
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "accounts.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/balances/available" => 100,
        "/accounts/0/balances/current" => 110,
        "/accounts/0/apy" => 0,
        "/accounts/1/balances/current" => 23631.9805,
        "/accounts/2/balances/current" => 65262
      }
    )
  end

  def test_accounts_get_throws_bad_request_error_with_wiremock
    test_id = "accounts.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.accounts.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "accounts.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_accounts_get_throws_unauthorized_error_with_wiremock
    test_id = "accounts.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.accounts.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "accounts.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_accounts_get_throws_too_many_requests_error_with_wiremock
    test_id = "accounts.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.accounts.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "accounts.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_accounts_get_throws_internal_server_error_with_wiremock
    test_id = "accounts.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.accounts.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "accounts.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_accounts_get_throws_client_request_error_with_wiremock
    test_id = "accounts.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.accounts.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "accounts.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_accounts_get_throws_server_error_with_wiremock
    test_id = "accounts.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.accounts.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "accounts.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_accounts_get_balance_with_wiremock
    test_id = "accounts.get_balance.0"

    result = @client.accounts.get_balance(
      access_token: "string",
      options: {
        account_ids: ["string"]
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "accounts.get_balance.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/balance/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/balances/available" => 100,
        "/accounts/0/balances/current" => 110,
        "/accounts/0/apy" => 0,
        "/accounts/1/balances/current" => 410,
        "/accounts/1/balances/limit" => 2000,
        "/accounts/2/balances/current" => 65262
      }
    )
  end

  def test_accounts_get_balance_throws_bad_request_error_with_wiremock
    test_id = "accounts.get_balance.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.accounts.get_balance(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "accounts.get_balance.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/balance/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_accounts_get_balance_throws_unauthorized_error_with_wiremock
    test_id = "accounts.get_balance.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.accounts.get_balance(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "accounts.get_balance.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/balance/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_accounts_get_balance_throws_too_many_requests_error_with_wiremock
    test_id = "accounts.get_balance.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.accounts.get_balance(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "accounts.get_balance.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/balance/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_accounts_get_balance_throws_internal_server_error_with_wiremock
    test_id = "accounts.get_balance.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.accounts.get_balance(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "accounts.get_balance.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/balance/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_accounts_get_balance_throws_client_request_error_with_wiremock
    test_id = "accounts.get_balance.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.accounts.get_balance(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "accounts.get_balance.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/balance/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_accounts_get_balance_throws_server_error_with_wiremock
    test_id = "accounts.get_balance.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.accounts.get_balance(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "accounts.get_balance.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/accounts/balance/get",
      query_params: nil,
      expected: 1
    )
  end
end
