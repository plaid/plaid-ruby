# frozen_string_literal: true

require_relative "wiremock_test_case"

class CashflowReportWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_cashflow_report_refresh_with_wiremock
    test_id = "cashflow_report.refresh.0"

    @client.cashflow_report.refresh(
      access_token: "access_token",
      days_requested: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cashflow_report.refresh.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      expected: {
        "/days_requested" => 1
      }
    )
  end

  def test_cashflow_report_refresh_throws_bad_request_error_with_wiremock
    test_id = "cashflow_report.refresh.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cashflow_report.refresh(
        access_token: "access_token",
        days_requested: 730,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.refresh.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      expected: {
        "/days_requested" => 730
      }
    )
  end

  def test_cashflow_report_refresh_throws_unauthorized_error_with_wiremock
    test_id = "cashflow_report.refresh.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.cashflow_report.refresh(
        access_token: "access_token",
        days_requested: 730,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.refresh.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      expected: {
        "/days_requested" => 730
      }
    )
  end

  def test_cashflow_report_refresh_throws_too_many_requests_error_with_wiremock
    test_id = "cashflow_report.refresh.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cashflow_report.refresh(
        access_token: "access_token",
        days_requested: 730,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.refresh.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      expected: {
        "/days_requested" => 730
      }
    )
  end

  def test_cashflow_report_refresh_throws_internal_server_error_with_wiremock
    test_id = "cashflow_report.refresh.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cashflow_report.refresh(
        access_token: "access_token",
        days_requested: 730,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.refresh.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      expected: {
        "/days_requested" => 730
      }
    )
  end

  def test_cashflow_report_refresh_throws_client_request_error_with_wiremock
    test_id = "cashflow_report.refresh.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cashflow_report.refresh(
        access_token: "access_token",
        days_requested: 730,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.refresh.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      expected: {
        "/days_requested" => 730
      }
    )
  end

  def test_cashflow_report_refresh_throws_server_error_with_wiremock
    test_id = "cashflow_report.refresh.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cashflow_report.refresh(
        access_token: "access_token",
        days_requested: 730,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.refresh.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/refresh",
      expected: {
        "/days_requested" => 730
      }
    )
  end

  def test_cashflow_report_get_with_wiremock
    test_id = "cashflow_report.get.0"

    result = @client.cashflow_report.get(
      access_token: "access_token",
      days_requested: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cashflow_report.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      expected: {
        "/days_requested" => 1
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/balances/available" => 110.94,
        "/accounts/0/balances/current" => 110.94,
        "/accounts/0/apy" => 0,
        "/transactions/0/amount" => 28.34,
        "/transactions/1/amount" => 72.1,
        "/transactions/1/location/lat" => 32.959068,
        "/transactions/1/location/lon" => -117.037666,
        "/total_transactions" => 2
      }
    )
  end

  def test_cashflow_report_get_throws_bad_request_error_with_wiremock
    test_id = "cashflow_report.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cashflow_report.get(
        access_token: "access_token",
        days_requested: 730,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      expected: {
        "/days_requested" => 730
      }
    )
  end

  def test_cashflow_report_get_throws_unauthorized_error_with_wiremock
    test_id = "cashflow_report.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.cashflow_report.get(
        access_token: "access_token",
        days_requested: 730,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      expected: {
        "/days_requested" => 730
      }
    )
  end

  def test_cashflow_report_get_throws_too_many_requests_error_with_wiremock
    test_id = "cashflow_report.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cashflow_report.get(
        access_token: "access_token",
        days_requested: 730,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      expected: {
        "/days_requested" => 730
      }
    )
  end

  def test_cashflow_report_get_throws_internal_server_error_with_wiremock
    test_id = "cashflow_report.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cashflow_report.get(
        access_token: "access_token",
        days_requested: 730,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      expected: {
        "/days_requested" => 730
      }
    )
  end

  def test_cashflow_report_get_throws_client_request_error_with_wiremock
    test_id = "cashflow_report.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cashflow_report.get(
        access_token: "access_token",
        days_requested: 730,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      expected: {
        "/days_requested" => 730
      }
    )
  end

  def test_cashflow_report_get_throws_server_error_with_wiremock
    test_id = "cashflow_report.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cashflow_report.get(
        access_token: "access_token",
        days_requested: 730,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/get",
      expected: {
        "/days_requested" => 730
      }
    )
  end

  def test_cashflow_report_get_transactions_with_wiremock
    test_id = "cashflow_report.get_transactions.0"

    result = @client.cashflow_report.get_transactions(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cashflow_report.get_transactions.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/transactions/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/balances/available" => 110.94,
        "/accounts/0/balances/current" => 110.94,
        "/accounts/0/apy" => 0,
        "/transactions/0/amount" => 28.34,
        "/transactions/1/amount" => 72.1,
        "/transactions/1/location/lat" => 32.959068,
        "/transactions/1/location/lon" => -117.037666,
        "/total_transactions" => 2
      }
    )
  end

  def test_cashflow_report_get_transactions_throws_bad_request_error_with_wiremock
    test_id = "cashflow_report.get_transactions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cashflow_report.get_transactions(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get_transactions.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cashflow_report_get_transactions_throws_unauthorized_error_with_wiremock
    test_id = "cashflow_report.get_transactions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.cashflow_report.get_transactions(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get_transactions.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cashflow_report_get_transactions_throws_too_many_requests_error_with_wiremock
    test_id = "cashflow_report.get_transactions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cashflow_report.get_transactions(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get_transactions.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cashflow_report_get_transactions_throws_internal_server_error_with_wiremock
    test_id = "cashflow_report.get_transactions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cashflow_report.get_transactions(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get_transactions.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cashflow_report_get_transactions_throws_client_request_error_with_wiremock
    test_id = "cashflow_report.get_transactions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cashflow_report.get_transactions(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get_transactions.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cashflow_report_get_transactions_throws_server_error_with_wiremock
    test_id = "cashflow_report.get_transactions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cashflow_report.get_transactions(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get_transactions.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cashflow_report_get_insights_with_wiremock
    test_id = "cashflow_report.get_insights.0"

    result = @client.cashflow_report.get_insights(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cashflow_report.get_insights.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/insights/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/balances/available" => 110.94,
        "/accounts/0/balances/current" => 110.94,
        "/accounts/0/apy" => 0,
        "/account_insights/historical_balances/0/amount" => 48050,
        "/account_insights/historical_balances/1/amount" => 49050,
        "/account_insights/historical_balances/2/amount" => 37050,
        "/account_insights/historical_balances/3/amount" => 35050,
        "/account_insights/monthly_summaries/0/average_daily_ending_balance/amount" => 42300,
        "/account_insights/monthly_summaries/0/average_daily_inflow_amount/amount" => 3050,
        "/account_insights/monthly_summaries/0/average_daily_outflow_amount/amount" => 250,
        "/account_insights/monthly_summaries/0/average_daily_net_cashflow_amount/amount" => 2800,
        "/account_insights/monthly_summaries/0/average_daily_inflow_transaction_count" => 6,
        "/account_insights/monthly_summaries/0/average_daily_outflow_transaction_count" => 2,
        "/account_insights/monthly_summaries/0/total_revenue/amount" => 16200,
        "/account_insights/monthly_summaries/0/total_loan_payment/amount" => 1000,
        "/account_insights/monthly_summaries/0/total_variable_expense/amount" => 250,
        "/account_insights/monthly_summaries/0/total_payroll/amount" => 200,
        "/account_insights/monthly_summaries/0/nsf_transaction_count" => 0,
        "/account_insights/monthly_summaries/0/overdraft_transaction_count" => 1,
        "/account_insights/monthly_summaries/0/negative_ending_balance_day_count" => 0
      }
    )
  end

  def test_cashflow_report_get_insights_throws_bad_request_error_with_wiremock
    test_id = "cashflow_report.get_insights.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cashflow_report.get_insights(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get_insights.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cashflow_report_get_insights_throws_unauthorized_error_with_wiremock
    test_id = "cashflow_report.get_insights.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.cashflow_report.get_insights(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get_insights.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cashflow_report_get_insights_throws_too_many_requests_error_with_wiremock
    test_id = "cashflow_report.get_insights.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cashflow_report.get_insights(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get_insights.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cashflow_report_get_insights_throws_internal_server_error_with_wiremock
    test_id = "cashflow_report.get_insights.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cashflow_report.get_insights(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get_insights.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cashflow_report_get_insights_throws_client_request_error_with_wiremock
    test_id = "cashflow_report.get_insights.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cashflow_report.get_insights(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get_insights.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cashflow_report_get_insights_throws_server_error_with_wiremock
    test_id = "cashflow_report.get_insights.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cashflow_report.get_insights(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cashflow_report.get_insights.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cashflow_report/insights/get",
      query_params: nil,
      expected: 1
    )
  end
end
