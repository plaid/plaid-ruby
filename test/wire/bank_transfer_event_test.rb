# frozen_string_literal: true

require_relative "wiremock_test_case"

class BankTransferEventWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_bank_transfer_event_list_with_wiremock
    test_id = "bank_transfer.event.list.0"

    result = @client.bank_transfer.event.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "bank_transfer.event.list.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_event_list_throws_bad_request_error_with_wiremock
    test_id = "bank_transfer.event.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.event.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.event.list.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_event_list_throws_unauthorized_error_with_wiremock
    test_id = "bank_transfer.event.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.bank_transfer.event.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.event.list.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_event_list_throws_too_many_requests_error_with_wiremock
    test_id = "bank_transfer.event.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.event.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.event.list.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_event_list_throws_internal_server_error_with_wiremock
    test_id = "bank_transfer.event.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.event.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.event.list.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_event_list_throws_client_request_error_with_wiremock
    test_id = "bank_transfer.event.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.event.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.event.list.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_event_list_throws_server_error_with_wiremock
    test_id = "bank_transfer.event.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.event.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.event.list.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_event_sync_with_wiremock
    test_id = "bank_transfer.event.sync.0"

    result = @client.bank_transfer.event.sync(
      after_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.event.sync.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      expected: {
        "/after_id" => 1
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/bank_transfer_events/0/event_id" => 1
      }
    )
  end

  def test_bank_transfer_event_sync_throws_bad_request_error_with_wiremock
    test_id = "bank_transfer.event.sync.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.event.sync(
        after_id: 1,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.event.sync.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      expected: {
        "/after_id" => 1
      }
    )
  end

  def test_bank_transfer_event_sync_throws_unauthorized_error_with_wiremock
    test_id = "bank_transfer.event.sync.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.bank_transfer.event.sync(
        after_id: 1,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.event.sync.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      expected: {
        "/after_id" => 1
      }
    )
  end

  def test_bank_transfer_event_sync_throws_too_many_requests_error_with_wiremock
    test_id = "bank_transfer.event.sync.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.event.sync(
        after_id: 1,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.event.sync.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      expected: {
        "/after_id" => 1
      }
    )
  end

  def test_bank_transfer_event_sync_throws_internal_server_error_with_wiremock
    test_id = "bank_transfer.event.sync.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.event.sync(
        after_id: 1,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.event.sync.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      expected: {
        "/after_id" => 1
      }
    )
  end

  def test_bank_transfer_event_sync_throws_client_request_error_with_wiremock
    test_id = "bank_transfer.event.sync.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.event.sync(
        after_id: 1,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.event.sync.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      expected: {
        "/after_id" => 1
      }
    )
  end

  def test_bank_transfer_event_sync_throws_server_error_with_wiremock
    test_id = "bank_transfer.event.sync.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.event.sync(
        after_id: 1,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.event.sync.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/event/sync",
      expected: {
        "/after_id" => 1
      }
    )
  end
end
