# frozen_string_literal: true

require_relative "wiremock_test_case"

class MonitoringInsightsWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_monitoring_insights_subscribe_with_wiremock
    test_id = "monitoring_insights.subscribe.0"

    @client.monitoring_insights.subscribe(
      webhook: "webhook",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "monitoring_insights.subscribe.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_subscribe_throws_bad_request_error_with_wiremock
    test_id = "monitoring_insights.subscribe.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.monitoring_insights.subscribe(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.subscribe.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_subscribe_throws_unauthorized_error_with_wiremock
    test_id = "monitoring_insights.subscribe.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.monitoring_insights.subscribe(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.subscribe.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_subscribe_throws_too_many_requests_error_with_wiremock
    test_id = "monitoring_insights.subscribe.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.monitoring_insights.subscribe(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.subscribe.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_subscribe_throws_internal_server_error_with_wiremock
    test_id = "monitoring_insights.subscribe.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.monitoring_insights.subscribe(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.subscribe.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_subscribe_throws_client_request_error_with_wiremock
    test_id = "monitoring_insights.subscribe.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.monitoring_insights.subscribe(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.subscribe.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_subscribe_throws_server_error_with_wiremock
    test_id = "monitoring_insights.subscribe.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.monitoring_insights.subscribe(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.subscribe.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_unsubscribe_with_wiremock
    test_id = "monitoring_insights.unsubscribe.0"

    @client.monitoring_insights.unsubscribe(
      subscription_id: "subscription_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "monitoring_insights.unsubscribe.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_unsubscribe_throws_bad_request_error_with_wiremock
    test_id = "monitoring_insights.unsubscribe.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.monitoring_insights.unsubscribe(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.unsubscribe.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_unsubscribe_throws_unauthorized_error_with_wiremock
    test_id = "monitoring_insights.unsubscribe.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.monitoring_insights.unsubscribe(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.unsubscribe.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_unsubscribe_throws_too_many_requests_error_with_wiremock
    test_id = "monitoring_insights.unsubscribe.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.monitoring_insights.unsubscribe(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.unsubscribe.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_unsubscribe_throws_internal_server_error_with_wiremock
    test_id = "monitoring_insights.unsubscribe.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.monitoring_insights.unsubscribe(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.unsubscribe.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_unsubscribe_throws_client_request_error_with_wiremock
    test_id = "monitoring_insights.unsubscribe.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.monitoring_insights.unsubscribe(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.unsubscribe.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_unsubscribe_throws_server_error_with_wiremock
    test_id = "monitoring_insights.unsubscribe.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.monitoring_insights.unsubscribe(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.unsubscribe.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_get_with_wiremock
    test_id = "monitoring_insights.get.0"

    result = @client.monitoring_insights.get(
      consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "monitoring_insights.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/items/0/insights/income/total_monthly_income/current_amount" => 20000.31,
        "/items/0/insights/income/income_sources_counts/current_count" => 1,
        "/items/0/insights/income/forecasted_monthly_income/current_amount" => 12000,
        "/items/0/insights/income/historical_annual_income/current_amount" => 144000,
        "/items/0/insights/loans/loan_payments_counts/current_count" => 1,
        "/items/0/insights/loans/loan_disbursements_count" => 1,
        "/items/0/insights/loans/loan_payment_merchants_counts/current_count" => 1,
        "/items/0/accounts/0/balances/available" => 5000,
        "/items/0/accounts/0/balances/current" => 5000,
        "/items/0/accounts/0/balances/average_balance" => 4956.12,
        "/items/0/accounts/0/balances/average_monthly_balances/0/average_balance/amount" => 4956.12,
        "/items/0/accounts/0/balances/most_recent_thirty_day_average_balance" => 4956.125,
        "/items/0/accounts/0/days_available" => 365,
        "/items/0/accounts/0/transactions/0/amount" => 37.07,
        "/items/0/accounts/0/transactions/1/amount" => 51.61,
        "/items/0/accounts/0/transactions/2/amount" => 7.55,
        "/items/0/accounts/0/transactions/3/amount" => 12.87,
        "/items/0/accounts/0/transactions/4/amount" => 44.21,
        "/items/0/accounts/0/transactions/5/amount" => 36.82,
        "/items/0/accounts/0/transactions/6/amount" => 13.27,
        "/items/0/accounts/0/transactions/7/amount" => 36.03,
        "/items/0/accounts/0/transactions/8/amount" => 54.74,
        "/items/0/accounts/0/transactions/9/amount" => 37.5,
        "/items/0/accounts/0/transactions/10/amount" => 41.42,
        "/items/0/accounts/0/transactions/11/amount" => -1077.93,
        "/items/0/accounts/0/transactions/12/amount" => 47.17,
        "/items/0/accounts/0/transactions/13/amount" => 12.37,
        "/items/0/accounts/0/transactions/14/amount" => 44.18,
        "/items/0/accounts/0/transactions/15/amount" => 45.37,
        "/items/0/accounts/0/transactions/16/amount" => 15.22,
        "/items/0/accounts/0/transactions/17/amount" => 26.33,
        "/items/0/accounts/0/transactions/18/amount" => 39.8,
        "/items/0/accounts/0/transactions/19/amount" => 45.06,
        "/items/0/accounts/0/transactions/20/amount" => 34.91,
        "/items/0/accounts/0/transactions/21/amount" => 49.78,
        "/items/0/accounts/0/transactions/22/amount" => 54.24,
        "/items/0/accounts/0/transactions/23/amount" => 41.79,
        "/items/0/accounts/0/transactions/24/amount" => 33.86,
        "/items/0/accounts/0/transactions/25/amount" => 27.08,
        "/items/0/accounts/0/transactions/26/amount" => 25.94,
        "/items/0/accounts/0/transactions/27/amount" => 27.57,
        "/items/0/accounts/0/attributes/total_inflow_amount/amount" => -2500,
        "/items/0/accounts/0/attributes/total_inflow_amount_30d/amount" => -1000,
        "/items/0/accounts/0/attributes/total_inflow_amount_60d/amount" => -2500,
        "/items/0/accounts/0/attributes/total_inflow_amount_90d/amount" => -2500,
        "/items/0/accounts/0/attributes/total_outflow_amount/amount" => 2500,
        "/items/0/accounts/0/attributes/total_outflow_amount_30d/amount" => 1000,
        "/items/0/accounts/0/attributes/total_outflow_amount_60d/amount" => 2500,
        "/items/0/accounts/0/attributes/total_outflow_amount_90d/amount" => 2500
      }
    )
  end

  def test_monitoring_insights_get_throws_bad_request_error_with_wiremock
    test_id = "monitoring_insights.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.monitoring_insights.get(
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_get_throws_unauthorized_error_with_wiremock
    test_id = "monitoring_insights.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.monitoring_insights.get(
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_get_throws_too_many_requests_error_with_wiremock
    test_id = "monitoring_insights.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.monitoring_insights.get(
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_get_throws_internal_server_error_with_wiremock
    test_id = "monitoring_insights.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.monitoring_insights.get(
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_get_throws_client_request_error_with_wiremock
    test_id = "monitoring_insights.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.monitoring_insights.get(
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_monitoring_insights_get_throws_server_error_with_wiremock
    test_id = "monitoring_insights.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.monitoring_insights.get(
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "monitoring_insights.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/monitoring_insights/get",
      query_params: nil,
      expected: 1
    )
  end
end
