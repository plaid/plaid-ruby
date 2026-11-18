# frozen_string_literal: true

require_relative "wiremock_test_case"

class BeaconAccountRiskWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_beacon_account_risk_evaluate_with_wiremock
    test_id = "beacon_account_risk.evaluate.0"

    result = @client.beacon_account_risk.evaluate(request_options: {
      additional_headers: {
        "X-Test-Id" => "beacon_account_risk.evaluate.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/account_risk/v1/evaluate",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/attributes/days_since_first_plaid_connection" => 510,
        "/accounts/0/attributes/total_plaid_connections_count" => 15,
        "/accounts/0/attributes/plaid_connections_count_7d" => 6,
        "/accounts/0/attributes/plaid_connections_count_30d" => 7
      }
    )
  end

  def test_beacon_account_risk_evaluate_throws_bad_request_error_with_wiremock
    test_id = "beacon_account_risk.evaluate.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_account_risk.evaluate(request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_account_risk.evaluate.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/account_risk/v1/evaluate",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_account_risk_evaluate_throws_unauthorized_error_with_wiremock
    test_id = "beacon_account_risk.evaluate.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.beacon_account_risk.evaluate(request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_account_risk.evaluate.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/account_risk/v1/evaluate",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_account_risk_evaluate_throws_too_many_requests_error_with_wiremock
    test_id = "beacon_account_risk.evaluate.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_account_risk.evaluate(request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_account_risk.evaluate.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/account_risk/v1/evaluate",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_account_risk_evaluate_throws_internal_server_error_with_wiremock
    test_id = "beacon_account_risk.evaluate.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_account_risk.evaluate(request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_account_risk.evaluate.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/account_risk/v1/evaluate",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_account_risk_evaluate_throws_client_request_error_with_wiremock
    test_id = "beacon_account_risk.evaluate.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_account_risk.evaluate(request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_account_risk.evaluate.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/account_risk/v1/evaluate",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_account_risk_evaluate_throws_server_error_with_wiremock
    test_id = "beacon_account_risk.evaluate.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_account_risk.evaluate(request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_account_risk.evaluate.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/account_risk/v1/evaluate",
      query_params: nil,
      expected: 1
    )
  end
end
