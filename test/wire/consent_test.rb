# frozen_string_literal: true

require_relative "wiremock_test_case"

class ConsentWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_consent_get_events_with_wiremock
    test_id = "consent.get_events.0"

    @client.consent.get_events(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "consent.get_events.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consent/events/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_consent_get_events_throws_bad_request_error_with_wiremock
    test_id = "consent.get_events.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.consent.get_events(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "consent.get_events.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consent/events/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_consent_get_events_throws_unauthorized_error_with_wiremock
    test_id = "consent.get_events.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.consent.get_events(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "consent.get_events.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consent/events/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_consent_get_events_throws_too_many_requests_error_with_wiremock
    test_id = "consent.get_events.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.consent.get_events(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "consent.get_events.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consent/events/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_consent_get_events_throws_internal_server_error_with_wiremock
    test_id = "consent.get_events.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.consent.get_events(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "consent.get_events.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consent/events/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_consent_get_events_throws_client_request_error_with_wiremock
    test_id = "consent.get_events.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.consent.get_events(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "consent.get_events.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consent/events/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_consent_get_events_throws_server_error_with_wiremock
    test_id = "consent.get_events.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.consent.get_events(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "consent.get_events.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/consent/events/get",
      query_params: nil,
      expected: 1
    )
  end
end
