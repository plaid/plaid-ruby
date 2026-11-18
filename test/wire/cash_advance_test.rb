# frozen_string_literal: true

require_relative "wiremock_test_case"

class CashAdvanceWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_cash_advance_get_income_insights_with_wiremock
    test_id = "cash_advance.get_income_insights.0"

    result = @client.cash_advance.get_income_insights(
      user_id: "usr_9nSp2KuZ2x4JDw",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cash_advance.get_income_insights.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/cash_advance/income_insights/v1/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/next_payment_amount" => 1450.37
      }
    )
  end

  def test_cash_advance_get_income_insights_throws_bad_request_error_with_wiremock
    test_id = "cash_advance.get_income_insights.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cash_advance.get_income_insights(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cash_advance.get_income_insights.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/cash_advance/income_insights/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cash_advance_get_income_insights_throws_unauthorized_error_with_wiremock
    test_id = "cash_advance.get_income_insights.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.cash_advance.get_income_insights(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cash_advance.get_income_insights.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/cash_advance/income_insights/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cash_advance_get_income_insights_throws_too_many_requests_error_with_wiremock
    test_id = "cash_advance.get_income_insights.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cash_advance.get_income_insights(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cash_advance.get_income_insights.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/cash_advance/income_insights/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cash_advance_get_income_insights_throws_internal_server_error_with_wiremock
    test_id = "cash_advance.get_income_insights.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cash_advance.get_income_insights(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cash_advance.get_income_insights.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/cash_advance/income_insights/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cash_advance_get_income_insights_throws_client_request_error_with_wiremock
    test_id = "cash_advance.get_income_insights.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cash_advance.get_income_insights(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cash_advance.get_income_insights.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/cash_advance/income_insights/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cash_advance_get_income_insights_throws_server_error_with_wiremock
    test_id = "cash_advance.get_income_insights.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cash_advance.get_income_insights(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cash_advance.get_income_insights.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/cash_advance/income_insights/v1/get",
      query_params: nil,
      expected: 1
    )
  end
end
