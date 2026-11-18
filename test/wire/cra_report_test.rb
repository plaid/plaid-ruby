# frozen_string_literal: true

require_relative "wiremock_test_case"

class CraReportWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_cra_report_create_with_wiremock
    test_id = "cra_report.create.0"

    @client.cra_report.create(
      user_id: "user_id",
      products: [],
      scope: "PLAID_NETWORK",
      decision_stage: "PREQUALIFICATION",
      consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cra_report.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_create_throws_bad_request_error_with_wiremock
    test_id = "cra_report.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cra_report.create(
        user_id: "user_id",
        products: [],
        scope: "PLAID_NETWORK",
        decision_stage: "PREQUALIFICATION",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cra_report.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_create_throws_unauthorized_error_with_wiremock
    test_id = "cra_report.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.cra_report.create(
        user_id: "user_id",
        products: [],
        scope: "PLAID_NETWORK",
        decision_stage: "PREQUALIFICATION",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cra_report.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_create_throws_too_many_requests_error_with_wiremock
    test_id = "cra_report.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cra_report.create(
        user_id: "user_id",
        products: [],
        scope: "PLAID_NETWORK",
        decision_stage: "PREQUALIFICATION",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cra_report.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_create_throws_internal_server_error_with_wiremock
    test_id = "cra_report.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cra_report.create(
        user_id: "user_id",
        products: [],
        scope: "PLAID_NETWORK",
        decision_stage: "PREQUALIFICATION",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cra_report.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_create_throws_client_request_error_with_wiremock
    test_id = "cra_report.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cra_report.create(
        user_id: "user_id",
        products: [],
        scope: "PLAID_NETWORK",
        decision_stage: "PREQUALIFICATION",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cra_report.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_create_throws_server_error_with_wiremock
    test_id = "cra_report.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cra_report.create(
        user_id: "user_id",
        products: [],
        scope: "PLAID_NETWORK",
        decision_stage: "PREQUALIFICATION",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cra_report.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_get_with_wiremock
    test_id = "cra_report.get.0"

    @client.cra_report.get(
      user_id: "user_id",
      products: [],
      decision_stage: "PREQUALIFICATION",
      consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cra_report.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_get_example2_with_wiremock
    test_id = "cra_report.get.1"

    result = @client.cra_report.get(
      user_id: "user_id",
      products: [],
      decision_stage: "PREQUALIFICATION",
      consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "cra_report.get.1"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/report/products/0/items/0/accounts/0/days_available" => 1,
        "/report/products/0/items/0/accounts/0/balances/average_monthly_balances/0/average_balance/amount" => 1.1,
        "/report/products/0/items/0/accounts/0/transactions/0/amount" => 1.1,
        "/report/products/0/attributes/total_inflow_amount/amount" => -2500,
        "/report/products/0/attributes/total_inflow_amount_30d/amount" => -1000,
        "/report/products/0/attributes/total_inflow_amount_60d/amount" => -2500,
        "/report/products/0/attributes/total_inflow_amount_90d/amount" => -2500,
        "/report/products/0/attributes/total_outflow_amount/amount" => 2500,
        "/report/products/0/attributes/total_outflow_amount_30d/amount" => 1000,
        "/report/products/0/attributes/total_outflow_amount_60d/amount" => 2500,
        "/report/products/0/attributes/total_outflow_amount_90d/amount" => 2500
      }
    )
  end

  def test_cra_report_get_throws_bad_request_error_with_wiremock
    test_id = "cra_report.get.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cra_report.get(
        user_id: "user_id",
        products: [],
        decision_stage: "PREQUALIFICATION",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cra_report.get.2"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_get_throws_unauthorized_error_with_wiremock
    test_id = "cra_report.get.3"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.cra_report.get(
        user_id: "user_id",
        products: [],
        decision_stage: "PREQUALIFICATION",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cra_report.get.3"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_get_throws_too_many_requests_error_with_wiremock
    test_id = "cra_report.get.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cra_report.get(
        user_id: "user_id",
        products: [],
        decision_stage: "PREQUALIFICATION",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cra_report.get.4"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_get_throws_internal_server_error_with_wiremock
    test_id = "cra_report.get.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cra_report.get(
        user_id: "user_id",
        products: [],
        decision_stage: "PREQUALIFICATION",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cra_report.get.5"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_get_throws_client_request_error_with_wiremock
    test_id = "cra_report.get.6"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.cra_report.get(
        user_id: "user_id",
        products: [],
        decision_stage: "PREQUALIFICATION",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cra_report.get.6"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_cra_report_get_throws_server_error_with_wiremock
    test_id = "cra_report.get.7"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.cra_report.get(
        user_id: "user_id",
        products: [],
        decision_stage: "PREQUALIFICATION",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "cra_report.get.7"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/report/get",
      query_params: nil,
      expected: 1
    )
  end
end
