# frozen_string_literal: true

require_relative "wiremock_test_case"

class EwaReportWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_ewa_report_get_with_wiremock
    test_id = "ewa_report.get.0"

    result = @client.ewa_report.get(
      access_token: "access-sandbox-71e02f71-0960-4a27-abd2-5631e04f2175",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "ewa_report.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/ewa_report/v1/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/ewa_scores/0/lowest_amount" => 0,
        "/ewa_scores/0/highest_amount" => 25,
        "/ewa_scores/0/score" => 75,
        "/ewa_scores/1/lowest_amount" => 25,
        "/ewa_scores/1/highest_amount" => 50,
        "/ewa_scores/1/score" => 72,
        "/ewa_scores/2/lowest_amount" => 50,
        "/ewa_scores/2/highest_amount" => 100,
        "/ewa_scores/2/score" => 68,
        "/ewa_scores/3/lowest_amount" => 100,
        "/ewa_scores/3/highest_amount" => 200,
        "/ewa_scores/3/score" => 65,
        "/ewa_scores/4/lowest_amount" => 200,
        "/ewa_scores/4/highest_amount" => 300,
        "/ewa_scores/4/score" => 60,
        "/ewa_scores/5/lowest_amount" => 300,
        "/ewa_scores/5/highest_amount" => 400,
        "/ewa_scores/5/score" => 55,
        "/ewa_scores/6/lowest_amount" => 400,
        "/ewa_scores/6/highest_amount" => 500,
        "/ewa_scores/6/score" => 50,
        "/ewa_attributes/key" => 1.1
      }
    )
  end

  def test_ewa_report_get_throws_bad_request_error_with_wiremock
    test_id = "ewa_report.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.ewa_report.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "ewa_report.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/ewa_report/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_ewa_report_get_throws_unauthorized_error_with_wiremock
    test_id = "ewa_report.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.ewa_report.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "ewa_report.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/ewa_report/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_ewa_report_get_throws_too_many_requests_error_with_wiremock
    test_id = "ewa_report.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.ewa_report.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "ewa_report.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/ewa_report/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_ewa_report_get_throws_internal_server_error_with_wiremock
    test_id = "ewa_report.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.ewa_report.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "ewa_report.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/ewa_report/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_ewa_report_get_throws_client_request_error_with_wiremock
    test_id = "ewa_report.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.ewa_report.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "ewa_report.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/ewa_report/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_ewa_report_get_throws_server_error_with_wiremock
    test_id = "ewa_report.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.ewa_report.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "ewa_report.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/ewa_report/v1/get",
      query_params: nil,
      expected: 1
    )
  end
end
