# frozen_string_literal: true

require_relative "wiremock_test_case"

class LiabilitiesWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_liabilities_get_with_wiremock
    test_id = "liabilities.get.0"

    result = @client.liabilities.get(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "liabilities.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/liabilities/get",
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
        "/accounts/2/balances/current" => 65262,
        "/accounts/3/balances/current" => 56302.06,
        "/accounts/4/balances/current" => 18250,
        "/accounts/5/balances/available" => 76000,
        "/accounts/5/balances/current" => 24000,
        "/accounts/5/balances/limit" => 100000,
        "/liabilities/credit/0/aprs/0/apr_percentage" => 15.24,
        "/liabilities/credit/0/aprs/0/balance_subject_to_apr" => 1562.32,
        "/liabilities/credit/0/aprs/0/interest_charge_amount" => 130.22,
        "/liabilities/credit/0/aprs/1/apr_percentage" => 27.95,
        "/liabilities/credit/0/aprs/1/balance_subject_to_apr" => 56.22,
        "/liabilities/credit/0/aprs/1/interest_charge_amount" => 14.81,
        "/liabilities/credit/0/aprs/2/apr_percentage" => 12.5,
        "/liabilities/credit/0/aprs/2/balance_subject_to_apr" => 157.01,
        "/liabilities/credit/0/aprs/2/interest_charge_amount" => 25.66,
        "/liabilities/credit/0/aprs/3/apr_percentage" => 0,
        "/liabilities/credit/0/aprs/3/balance_subject_to_apr" => 1000,
        "/liabilities/credit/0/aprs/3/interest_charge_amount" => 0,
        "/liabilities/credit/0/last_payment_amount" => 168.25,
        "/liabilities/credit/0/last_statement_balance" => 1708.77,
        "/liabilities/credit/0/minimum_payment_amount" => 20,
        "/liabilities/credit/0/cash_advance_limit" => 500,
        "/liabilities/mortgage/0/current_late_fee" => 25,
        "/liabilities/mortgage/0/escrow_balance" => 3141.54,
        "/liabilities/mortgage/0/interest_rate/percentage" => 3.99,
        "/liabilities/mortgage/0/last_payment_amount" => 3141.54,
        "/liabilities/mortgage/0/next_monthly_payment" => 3141.54,
        "/liabilities/mortgage/0/origination_principal_amount" => 425000,
        "/liabilities/mortgage/0/past_due_amount" => 2304,
        "/liabilities/mortgage/0/ytd_interest_paid" => 12300.4,
        "/liabilities/mortgage/0/ytd_principal_paid" => 12340.5,
        "/liabilities/student/0/interest_rate_percentage" => 5.25,
        "/liabilities/student/0/last_payment_amount" => 138.05,
        "/liabilities/student/0/last_statement_balance" => 1708.77,
        "/liabilities/student/0/minimum_payment_amount" => 25,
        "/liabilities/student/0/origination_principal_amount" => 25000,
        "/liabilities/student/0/outstanding_interest_amount" => 6227.36,
        "/liabilities/student/0/ytd_interest_paid" => 280.55,
        "/liabilities/student/0/ytd_principal_paid" => 271.65,
        "/liabilities/loan/0/interest_rate/percentage" => 6.49,
        "/liabilities/loan/0/principal_balance" => 18250,
        "/liabilities/loan/0/origination_principal_amount" => 32000,
        "/liabilities/loan/0/loan_term_months" => 72,
        "/liabilities/loan/0/payment_count" => 72,
        "/liabilities/loan/0/next_payment_amount" => 525.4,
        "/liabilities/loan/0/last_payment_amount" => 525.4,
        "/liabilities/loan/0/payoff_amount" => 18190.25,
        "/liabilities/loan/0/ytd_interest_paid" => 612.18,
        "/liabilities/line_of_credit/0/interest_rate/percentage" => 8.25,
        "/liabilities/line_of_credit/0/credit_limit" => 100000,
        "/liabilities/line_of_credit/0/available_credit" => 76000,
        "/liabilities/line_of_credit/0/principal_balance" => 24000,
        "/liabilities/line_of_credit/0/minimum_payment_amount" => 180,
        "/liabilities/line_of_credit/0/next_payment_amount" => 180,
        "/liabilities/line_of_credit/0/last_payment_amount" => 180,
        "/liabilities/line_of_credit/0/last_statement_balance" => 24000,
        "/liabilities/line_of_credit/0/past_due_amount" => 0,
        "/liabilities/line_of_credit/0/finance_charges" => 162.5,
        "/liabilities/line_of_credit/0/aprs/0/apr_percentage" => 8.25
      }
    )
  end

  def test_liabilities_get_throws_bad_request_error_with_wiremock
    test_id = "liabilities.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.liabilities.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "liabilities.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/liabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_liabilities_get_throws_unauthorized_error_with_wiremock
    test_id = "liabilities.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.liabilities.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "liabilities.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/liabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_liabilities_get_throws_too_many_requests_error_with_wiremock
    test_id = "liabilities.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.liabilities.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "liabilities.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/liabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_liabilities_get_throws_internal_server_error_with_wiremock
    test_id = "liabilities.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.liabilities.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "liabilities.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/liabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_liabilities_get_throws_client_request_error_with_wiremock
    test_id = "liabilities.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.liabilities.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "liabilities.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/liabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_liabilities_get_throws_server_error_with_wiremock
    test_id = "liabilities.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.liabilities.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "liabilities.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/liabilities/get",
      query_params: nil,
      expected: 1
    )
  end
end
