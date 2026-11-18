# frozen_string_literal: true

require_relative "wiremock_test_case"

class CreditProfileWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_credit_profile_get_report_with_wiremock
    test_id = "credit.profile.get_report.0"

    @client.credit.profile.get_report(
      user_id: "user_id",
      consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
      client_report_id: "client_report_id",
      report_type: "QUALIFY",
      inquiry_type: "SOFT_INQUIRY",
      version: "v1",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.profile.get_report.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/credit_profile/report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_profile_get_report_throws_bad_request_error_with_wiremock
    test_id = "credit.profile.get_report.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.profile.get_report(
        user_id: "user_id",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        client_report_id: "client_report_id",
        report_type: "QUALIFY",
        inquiry_type: "SOFT_INQUIRY",
        version: "v1",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.profile.get_report.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/credit_profile/report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_profile_get_report_throws_unauthorized_error_with_wiremock
    test_id = "credit.profile.get_report.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.profile.get_report(
        user_id: "user_id",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        client_report_id: "client_report_id",
        report_type: "QUALIFY",
        inquiry_type: "SOFT_INQUIRY",
        version: "v1",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.profile.get_report.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/credit_profile/report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_profile_get_report_throws_too_many_requests_error_with_wiremock
    test_id = "credit.profile.get_report.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.profile.get_report(
        user_id: "user_id",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        client_report_id: "client_report_id",
        report_type: "QUALIFY",
        inquiry_type: "SOFT_INQUIRY",
        version: "v1",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.profile.get_report.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/credit_profile/report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_profile_get_report_throws_internal_server_error_with_wiremock
    test_id = "credit.profile.get_report.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.profile.get_report(
        user_id: "user_id",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        client_report_id: "client_report_id",
        report_type: "QUALIFY",
        inquiry_type: "SOFT_INQUIRY",
        version: "v1",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.profile.get_report.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/credit_profile/report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_profile_get_report_throws_client_request_error_with_wiremock
    test_id = "credit.profile.get_report.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.profile.get_report(
        user_id: "user_id",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        client_report_id: "client_report_id",
        report_type: "QUALIFY",
        inquiry_type: "SOFT_INQUIRY",
        version: "v1",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.profile.get_report.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/credit_profile/report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_profile_get_report_throws_server_error_with_wiremock
    test_id = "credit.profile.get_report.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.profile.get_report(
        user_id: "user_id",
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        client_report_id: "client_report_id",
        report_type: "QUALIFY",
        inquiry_type: "SOFT_INQUIRY",
        version: "v1",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.profile.get_report.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/credit_profile/report/get",
      query_params: nil,
      expected: 1
    )
  end
end
