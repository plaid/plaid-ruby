# frozen_string_literal: true

require_relative "wiremock_test_case"

class TransferRecurringWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_transfer_recurring_get_with_wiremock
    test_id = "transfer.recurring.get.0"

    result = @client.transfer.recurring.get(
      recurring_transfer_id: "recurring_transfer_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.recurring.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/recurring_transfer/schedule/interval_count" => 1,
        "/recurring_transfer/schedule/interval_execution_day" => 5
      }
    )
  end

  def test_transfer_recurring_get_throws_bad_request_error_with_wiremock
    test_id = "transfer.recurring.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recurring.get(
        recurring_transfer_id: "recurring_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_get_throws_unauthorized_error_with_wiremock
    test_id = "transfer.recurring.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.recurring.get(
        recurring_transfer_id: "recurring_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_get_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.recurring.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recurring.get(
        recurring_transfer_id: "recurring_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_get_throws_internal_server_error_with_wiremock
    test_id = "transfer.recurring.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.recurring.get(
        recurring_transfer_id: "recurring_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_get_throws_client_request_error_with_wiremock
    test_id = "transfer.recurring.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recurring.get(
        recurring_transfer_id: "recurring_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_get_throws_server_error_with_wiremock
    test_id = "transfer.recurring.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.recurring.get(
        recurring_transfer_id: "recurring_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_create_with_wiremock
    test_id = "transfer.recurring.create.0"

    result = @client.transfer.recurring.create(
      access_token: "access_token",
      idempotency_key: "idempotency_key",
      account_id: "account_id",
      type: "debit",
      network: "ach",
      amount: "amount",
      description: "description",
      schedule: {
        interval_unit: "week",
        interval_count: 1,
        interval_execution_day: 1,
        start_date: "2023-01-15"
      },
      user: {
        legal_name: "legal_name"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.recurring.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      expected: {
        "/schedule/interval_count" => 1,
        "/schedule/interval_execution_day" => 1
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/recurring_transfer/schedule/interval_count" => 1,
        "/recurring_transfer/schedule/interval_execution_day" => 5
      }
    )
  end

  def test_transfer_recurring_create_throws_bad_request_error_with_wiremock
    test_id = "transfer.recurring.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recurring.create(
        access_token: "access_token",
        idempotency_key: "idempotency_key",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        description: "description",
        schedule: {
          interval_unit: "week",
          interval_count: 1,
          interval_execution_day: 1,
          start_date: "2023-01-15"
        },
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      expected: {
        "/schedule/interval_count" => 1,
        "/schedule/interval_execution_day" => 1
      }
    )
  end

  def test_transfer_recurring_create_throws_unauthorized_error_with_wiremock
    test_id = "transfer.recurring.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.recurring.create(
        access_token: "access_token",
        idempotency_key: "idempotency_key",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        description: "description",
        schedule: {
          interval_unit: "week",
          interval_count: 1,
          interval_execution_day: 1,
          start_date: "2023-01-15"
        },
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      expected: {
        "/schedule/interval_count" => 1,
        "/schedule/interval_execution_day" => 1
      }
    )
  end

  def test_transfer_recurring_create_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.recurring.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recurring.create(
        access_token: "access_token",
        idempotency_key: "idempotency_key",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        description: "description",
        schedule: {
          interval_unit: "week",
          interval_count: 1,
          interval_execution_day: 1,
          start_date: "2023-01-15"
        },
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      expected: {
        "/schedule/interval_count" => 1,
        "/schedule/interval_execution_day" => 1
      }
    )
  end

  def test_transfer_recurring_create_throws_internal_server_error_with_wiremock
    test_id = "transfer.recurring.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.recurring.create(
        access_token: "access_token",
        idempotency_key: "idempotency_key",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        description: "description",
        schedule: {
          interval_unit: "week",
          interval_count: 1,
          interval_execution_day: 1,
          start_date: "2023-01-15"
        },
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      expected: {
        "/schedule/interval_count" => 1,
        "/schedule/interval_execution_day" => 1
      }
    )
  end

  def test_transfer_recurring_create_throws_client_request_error_with_wiremock
    test_id = "transfer.recurring.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recurring.create(
        access_token: "access_token",
        idempotency_key: "idempotency_key",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        description: "description",
        schedule: {
          interval_unit: "week",
          interval_count: 1,
          interval_execution_day: 1,
          start_date: "2023-01-15"
        },
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      expected: {
        "/schedule/interval_count" => 1,
        "/schedule/interval_execution_day" => 1
      }
    )
  end

  def test_transfer_recurring_create_throws_server_error_with_wiremock
    test_id = "transfer.recurring.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.recurring.create(
        access_token: "access_token",
        idempotency_key: "idempotency_key",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        description: "description",
        schedule: {
          interval_unit: "week",
          interval_count: 1,
          interval_execution_day: 1,
          start_date: "2023-01-15"
        },
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/create",
      expected: {
        "/schedule/interval_count" => 1,
        "/schedule/interval_execution_day" => 1
      }
    )
  end

  def test_transfer_recurring_list_with_wiremock
    test_id = "transfer.recurring.list.0"

    result = @client.transfer.recurring.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "transfer.recurring.list.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_list_throws_bad_request_error_with_wiremock
    test_id = "transfer.recurring.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recurring.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.recurring.list.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_list_throws_unauthorized_error_with_wiremock
    test_id = "transfer.recurring.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.recurring.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.recurring.list.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_list_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.recurring.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recurring.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.recurring.list.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_list_throws_internal_server_error_with_wiremock
    test_id = "transfer.recurring.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.recurring.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.recurring.list.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_list_throws_client_request_error_with_wiremock
    test_id = "transfer.recurring.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recurring.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.recurring.list.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_list_throws_server_error_with_wiremock
    test_id = "transfer.recurring.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.recurring.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.recurring.list.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_cancel_with_wiremock
    test_id = "transfer.recurring.cancel.0"

    @client.transfer.recurring.cancel(
      recurring_transfer_id: "recurring_transfer_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.recurring.cancel.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_cancel_throws_bad_request_error_with_wiremock
    test_id = "transfer.recurring.cancel.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recurring.cancel(
        recurring_transfer_id: "recurring_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.cancel.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_cancel_throws_unauthorized_error_with_wiremock
    test_id = "transfer.recurring.cancel.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.recurring.cancel(
        recurring_transfer_id: "recurring_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.cancel.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_cancel_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.recurring.cancel.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recurring.cancel(
        recurring_transfer_id: "recurring_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.cancel.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_cancel_throws_internal_server_error_with_wiremock
    test_id = "transfer.recurring.cancel.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.recurring.cancel(
        recurring_transfer_id: "recurring_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.cancel.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_cancel_throws_client_request_error_with_wiremock
    test_id = "transfer.recurring.cancel.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recurring.cancel(
        recurring_transfer_id: "recurring_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.cancel.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recurring_cancel_throws_server_error_with_wiremock
    test_id = "transfer.recurring.cancel.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.recurring.cancel(
        recurring_transfer_id: "recurring_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recurring.cancel.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/recurring/cancel",
      query_params: nil,
      expected: 1
    )
  end
end
