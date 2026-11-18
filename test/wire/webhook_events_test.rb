# frozen_string_literal: true

require_relative "wiremock_test_case"

class WebhookEventsWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_webhook_events_list_with_wiremock
    test_id = "webhook_events.list.0"

    result = @client.webhook_events.list(
      count: 100,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhook_events.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      expected: {
        "/count" => 100
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/webhook_events/0/last_http_status_code" => 200,
        "/webhook_events/0/attempt_count" => 1
      }
    )
  end

  def test_webhook_events_list_filtered_with_wiremock
    test_id = "webhook_events.list.1"

    result = @client.webhook_events.list(
      count: 100,
      webhook_types: %w[ITEM AUTH],
      delivery_statuses: ["FAILED"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhook_events.list.1"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      expected: {
        "/count" => 100
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/webhook_events/0/last_http_status_code" => 200,
        "/webhook_events/0/attempt_count" => 1
      }
    )
  end

  def test_webhook_events_list_cursor_continuation_with_wiremock
    test_id = "webhook_events.list.2"

    result = @client.webhook_events.list(
      cursor: "eyJzZW50X3RpbWUiOiIyMDI2LTA3LTIxVDE0OjMyOjAwWiIsIndlYmhvb2tfbWVzc2FnZV9pZCI6IndobXNnXzR0UTlwTnpMMnZCeFlLIn0",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhook_events.list.2"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/webhook_events/0/last_http_status_code" => 200,
        "/webhook_events/0/attempt_count" => 1
      }
    )
  end

  def test_webhook_events_list_pending_last_page_with_wiremock
    test_id = "webhook_events.list.3"

    result = @client.webhook_events.list(
      count: 100,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhook_events.list.3"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      expected: {
        "/count" => 100
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/webhook_events/0/attempt_count" => 0
      }
    )
  end

  def test_webhook_events_list_throws_bad_request_error_with_wiremock
    test_id = "webhook_events.list.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.webhook_events.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "webhook_events.list.4"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhook_events_list_throws_unauthorized_error_with_wiremock
    test_id = "webhook_events.list.5"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.webhook_events.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "webhook_events.list.5"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhook_events_list_throws_too_many_requests_error_with_wiremock
    test_id = "webhook_events.list.6"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.webhook_events.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "webhook_events.list.6"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhook_events_list_throws_internal_server_error_with_wiremock
    test_id = "webhook_events.list.7"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.webhook_events.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "webhook_events.list.7"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhook_events_list_throws_client_request_error_with_wiremock
    test_id = "webhook_events.list.8"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.webhook_events.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "webhook_events.list.8"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhook_events_list_throws_server_error_with_wiremock
    test_id = "webhook_events.list.9"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.webhook_events.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "webhook_events.list.9"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/webhook_events/list",
      query_params: nil,
      expected: 1
    )
  end
end
