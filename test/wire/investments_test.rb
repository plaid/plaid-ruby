# frozen_string_literal: true

require_relative "wiremock_test_case"

class InvestmentsWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_investments_get_holdings_with_wiremock
    test_id = "investments.get_holdings.0"

    result = @client.investments.get_holdings(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "investments.get_holdings.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/holdings/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/balances/available" => 43200,
        "/accounts/0/balances/current" => 43200,
        "/accounts/0/apy" => 1.85,
        "/accounts/1/balances/current" => 110.01,
        "/accounts/2/balances/current" => 24580.0605,
        "/accounts/3/balances/available" => 48200.03,
        "/accounts/3/balances/current" => 48200.03,
        "/holdings/0/institution_price" => 1,
        "/holdings/0/institution_value" => 0.01,
        "/holdings/0/cost_basis" => 0.01,
        "/holdings/0/quantity" => 0.01,
        "/holdings/1/institution_price" => 2.11,
        "/holdings/1/institution_value" => 2.11,
        "/holdings/1/cost_basis" => 1.5,
        "/holdings/1/quantity" => 1,
        "/holdings/1/vested_quantity" => 1,
        "/holdings/1/vested_value" => 2.11,
        "/holdings/2/institution_price" => 10.42,
        "/holdings/2/institution_value" => 20.84,
        "/holdings/2/cost_basis" => 20,
        "/holdings/2/quantity" => 2,
        "/holdings/2/tax_lots/0/quantity" => 1,
        "/holdings/2/tax_lots/0/purchase_price" => 9.5,
        "/holdings/2/tax_lots/0/cost_basis" => 9.5,
        "/holdings/2/tax_lots/0/current_value" => 10.42,
        "/holdings/2/tax_lots/1/quantity" => 1,
        "/holdings/2/tax_lots/1/purchase_price" => 10.5,
        "/holdings/2/tax_lots/1/cost_basis" => 10.5,
        "/holdings/2/tax_lots/1/current_value" => 10.42,
        "/holdings/3/institution_price" => 0.011,
        "/holdings/3/institution_value" => 110,
        "/holdings/3/cost_basis" => 100,
        "/holdings/3/quantity" => 10000,
        "/holdings/4/institution_price" => 27,
        "/holdings/4/institution_value" => 636.309,
        "/holdings/4/cost_basis" => 542.041,
        "/holdings/4/quantity" => 23.567,
        "/holdings/5/institution_price" => 13.73,
        "/holdings/5/institution_value" => 1373.6865,
        "/holdings/5/cost_basis" => 1500.75,
        "/holdings/5/quantity" => 100.05,
        "/holdings/6/institution_price" => 94.808,
        "/holdings/6/institution_value" => 948.08,
        "/holdings/6/cost_basis" => 948.08,
        "/holdings/6/quantity" => 10,
        "/holdings/7/institution_price" => 1,
        "/holdings/7/institution_value" => 12345.67,
        "/holdings/7/cost_basis" => 12345.67,
        "/holdings/7/quantity" => 12345.67,
        "/holdings/8/institution_price" => 0.177494362,
        "/holdings/8/institution_value" => 4437.35905,
        "/holdings/8/cost_basis" => 92.47,
        "/holdings/8/quantity" => 25000,
        "/securities/0/close_price" => 0.011,
        "/securities/0/option_contract/strike_price" => 355,
        "/securities/1/close_price" => 27,
        "/securities/2/close_price" => 2.11,
        "/securities/3/close_price" => 10.42,
        "/securities/4/close_price" => 1,
        "/securities/5/close_price" => 13.73,
        "/securities/6/close_price" => 94.808,
        "/securities/6/fixed_income/yield_rate/percentage" => 5.43,
        "/securities/6/fixed_income/face_value" => 100,
        "/securities/7/close_price" => 0.140034616
      }
    )
  end

  def test_investments_get_holdings_throws_bad_request_error_with_wiremock
    test_id = "investments.get_holdings.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.investments.get_holdings(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_holdings.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/holdings/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_holdings_throws_unauthorized_error_with_wiremock
    test_id = "investments.get_holdings.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.investments.get_holdings(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_holdings.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/holdings/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_holdings_throws_too_many_requests_error_with_wiremock
    test_id = "investments.get_holdings.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.investments.get_holdings(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_holdings.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/holdings/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_holdings_throws_internal_server_error_with_wiremock
    test_id = "investments.get_holdings.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.investments.get_holdings(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_holdings.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/holdings/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_holdings_throws_client_request_error_with_wiremock
    test_id = "investments.get_holdings.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.investments.get_holdings(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_holdings.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/holdings/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_holdings_throws_server_error_with_wiremock
    test_id = "investments.get_holdings.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.investments.get_holdings(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_holdings.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/holdings/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_transactions_with_wiremock
    test_id = "investments.get_transactions.0"

    result = @client.investments.get_transactions(
      access_token: "access_token",
      start_date: "2023-01-15",
      end_date: "2023-01-15",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "investments.get_transactions.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_transactions_throws_bad_request_error_with_wiremock
    test_id = "investments.get_transactions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.investments.get_transactions(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_transactions.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_transactions_throws_unauthorized_error_with_wiremock
    test_id = "investments.get_transactions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.investments.get_transactions(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_transactions.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_transactions_throws_too_many_requests_error_with_wiremock
    test_id = "investments.get_transactions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.investments.get_transactions(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_transactions.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_transactions_throws_internal_server_error_with_wiremock
    test_id = "investments.get_transactions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.investments.get_transactions(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_transactions.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_transactions_throws_client_request_error_with_wiremock
    test_id = "investments.get_transactions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.investments.get_transactions(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_transactions.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_transactions_throws_server_error_with_wiremock
    test_id = "investments.get_transactions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.investments.get_transactions(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_transactions.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_refresh_with_wiremock
    test_id = "investments.refresh.0"

    @client.investments.refresh(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "investments.refresh.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_refresh_throws_bad_request_error_with_wiremock
    test_id = "investments.refresh.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.investments.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.refresh.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_refresh_throws_unauthorized_error_with_wiremock
    test_id = "investments.refresh.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.investments.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.refresh.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_refresh_throws_too_many_requests_error_with_wiremock
    test_id = "investments.refresh.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.investments.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.refresh.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_refresh_throws_internal_server_error_with_wiremock
    test_id = "investments.refresh.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.investments.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.refresh.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_refresh_throws_client_request_error_with_wiremock
    test_id = "investments.refresh.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.investments.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.refresh.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_refresh_throws_server_error_with_wiremock
    test_id = "investments.refresh.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.investments.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.refresh.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_auth_with_wiremock
    test_id = "investments.get_auth.0"

    result = @client.investments.get_auth(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "investments.get_auth.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/auth/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/balances/available" => 43200,
        "/accounts/0/balances/current" => 43200,
        "/accounts/0/apy" => 1.85,
        "/accounts/1/balances/current" => 415.57,
        "/holdings/0/institution_price" => 1,
        "/holdings/0/institution_value" => 0.01,
        "/holdings/0/cost_basis" => 0.01,
        "/holdings/0/quantity" => 0.01,
        "/holdings/1/institution_price" => 0.011,
        "/holdings/1/institution_value" => 110,
        "/holdings/1/cost_basis" => 100,
        "/holdings/1/quantity" => 10000,
        "/holdings/2/institution_price" => 94.808,
        "/holdings/2/institution_value" => 94.808,
        "/holdings/2/cost_basis" => 94.808,
        "/holdings/2/quantity" => 1,
        "/holdings/3/institution_price" => 42.15,
        "/holdings/3/institution_value" => 210.75,
        "/holdings/3/cost_basis" => 200,
        "/holdings/3/quantity" => 5,
        "/securities/0/close_price" => 0.011,
        "/securities/1/close_price" => 94.808,
        "/securities/1/fixed_income/yield_rate/percentage" => 5.43,
        "/securities/1/fixed_income/face_value" => 100,
        "/securities/2/close_price" => 9.08,
        "/securities/3/close_price" => 42.15,
        "/securities/4/close_price" => 1,
        "/account_details_401k/0/fee_details/account_fee_count_12m" => 1,
        "/account_details_401k/0/fee_details/account_fee_amount_12m" => 1.1,
        "/account_details_401k/0/contribution_details/contribution_count_1m" => 1,
        "/account_details_401k/0/contribution_details/contribution_amount_1m" => 1.1,
        "/account_details_401k/0/contribution_details/contribution_count_6m" => 1,
        "/account_details_401k/0/contribution_details/contribution_amount_6m" => 1.1,
        "/account_details_401k/0/contribution_details/contribution_count_12m" => 1,
        "/account_details_401k/0/contribution_details/contribution_amount_12m" => 1.1
      }
    )
  end

  def test_investments_get_auth_throws_bad_request_error_with_wiremock
    test_id = "investments.get_auth.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.investments.get_auth(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_auth.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_auth_throws_unauthorized_error_with_wiremock
    test_id = "investments.get_auth.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.investments.get_auth(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_auth.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_auth_throws_too_many_requests_error_with_wiremock
    test_id = "investments.get_auth.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.investments.get_auth(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_auth.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_auth_throws_internal_server_error_with_wiremock
    test_id = "investments.get_auth.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.investments.get_auth(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_auth.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_auth_throws_client_request_error_with_wiremock
    test_id = "investments.get_auth.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.investments.get_auth(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_auth.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_investments_get_auth_throws_server_error_with_wiremock
    test_id = "investments.get_auth.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.investments.get_auth(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "investments.get_auth.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/investments/auth/get",
      query_params: nil,
      expected: 1
    )
  end
end
