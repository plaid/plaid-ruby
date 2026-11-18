# frozen_string_literal: true

require_relative "wiremock_test_case"

class PartnerInsightsWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_partner_insights_get_with_wiremock
    test_id = "partner.insights.get.0"

    result = @client.partner.insights.get(
      user_token: "user_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "partner.insights.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/partner_insights/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/report/0/prism/insights/version" => 3,
        "/report/0/prism/insights/result/l6m_cumbal_acc" => 1,
        "/report/0/prism/cash_score/version" => 3,
        "/report/0/prism/cash_score/score" => 900,
        "/report/0/prism/cash_score/metadata/max_age" => 20,
        "/report/0/prism/cash_score/metadata/min_age" => 1,
        "/report/0/prism/cash_score/metadata/min_age_credit" => 0,
        "/report/0/prism/cash_score/metadata/min_age_debit" => 1,
        "/report/0/prism/cash_score/metadata/max_age_debit" => 20,
        "/report/0/prism/cash_score/metadata/max_age_credit" => 0,
        "/report/0/prism/cash_score/metadata/num_trxn_credit" => 0,
        "/report/0/prism/cash_score/metadata/num_trxn_debit" => 40,
        "/report/0/prism/cash_score/metadata/l1m_credit_value_cnt" => 0,
        "/report/0/prism/cash_score/metadata/l1m_debit_value_cnt" => 40,
        "/report/0/prism/first_detect/version" => 3,
        "/report/0/prism/first_detect/score" => 900,
        "/report/0/prism/first_detect/metadata/max_age" => 20,
        "/report/0/prism/first_detect/metadata/min_age" => 1,
        "/report/0/prism/first_detect/metadata/min_age_credit" => 0,
        "/report/0/prism/first_detect/metadata/min_age_debit" => 1,
        "/report/0/prism/first_detect/metadata/max_age_debit" => 20,
        "/report/0/prism/first_detect/metadata/max_age_credit" => 0,
        "/report/0/prism/first_detect/metadata/num_trxn_credit" => 0,
        "/report/0/prism/first_detect/metadata/num_trxn_debit" => 40,
        "/report/0/prism/first_detect/metadata/l1m_credit_value_cnt" => 0,
        "/report/0/prism/first_detect/metadata/l1m_debit_value_cnt" => 40
      }
    )
  end

  def test_partner_insights_get_throws_bad_request_error_with_wiremock
    test_id = "partner.insights.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.insights.get(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.insights.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/partner_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_insights_get_throws_unauthorized_error_with_wiremock
    test_id = "partner.insights.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.partner.insights.get(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.insights.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/partner_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_insights_get_throws_too_many_requests_error_with_wiremock
    test_id = "partner.insights.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.insights.get(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.insights.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/partner_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_insights_get_throws_internal_server_error_with_wiremock
    test_id = "partner.insights.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.insights.get(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.insights.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/partner_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_insights_get_throws_client_request_error_with_wiremock
    test_id = "partner.insights.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.insights.get(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.insights.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/partner_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_insights_get_throws_server_error_with_wiremock
    test_id = "partner.insights.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.insights.get(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.insights.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/partner_insights/get",
      query_params: nil,
      expected: 1
    )
  end
end
