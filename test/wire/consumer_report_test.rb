# frozen_string_literal: true

require_relative "wiremock_test_case"

class ConsumerReportWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_consumer_report_get_pdf_with_wiremock
    test_id = "consumer_report.get_pdf.0"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.consumer_report.get_pdf(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "consumer_report.get_pdf.0"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consumer_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_consumer_report_get_pdf_throws_unauthorized_error_with_wiremock
    test_id = "consumer_report.get_pdf.1"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.consumer_report.get_pdf(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "consumer_report.get_pdf.1"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consumer_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_consumer_report_get_pdf_throws_too_many_requests_error_with_wiremock
    test_id = "consumer_report.get_pdf.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.consumer_report.get_pdf(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "consumer_report.get_pdf.2"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consumer_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_consumer_report_get_pdf_throws_internal_server_error_with_wiremock
    test_id = "consumer_report.get_pdf.3"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.consumer_report.get_pdf(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "consumer_report.get_pdf.3"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consumer_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_consumer_report_get_pdf_throws_client_request_error_with_wiremock
    test_id = "consumer_report.get_pdf.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.consumer_report.get_pdf(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "consumer_report.get_pdf.4"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consumer_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_consumer_report_get_pdf_throws_server_error_with_wiremock
    test_id = "consumer_report.get_pdf.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.consumer_report.get_pdf(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "consumer_report.get_pdf.5"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consumer_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end
end
