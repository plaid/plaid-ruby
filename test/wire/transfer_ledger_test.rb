# frozen_string_literal: true

require_relative "wiremock_test_case"

class TransferLedgerWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_transfer_ledger_get_with_wiremock
    test_id = "transfer.ledger.get.0"

    @client.transfer.ledger.get(request_options: {
      additional_headers: {
        "X-Test-Id" => "transfer.ledger.get.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_get_throws_bad_request_error_with_wiremock
    test_id = "transfer.ledger.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.get.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_get_throws_unauthorized_error_with_wiremock
    test_id = "transfer.ledger.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.ledger.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.get.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_get_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.ledger.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.get.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_get_throws_internal_server_error_with_wiremock
    test_id = "transfer.ledger.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.ledger.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.get.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_get_throws_client_request_error_with_wiremock
    test_id = "transfer.ledger.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.get.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_get_throws_server_error_with_wiremock
    test_id = "transfer.ledger.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.ledger.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.get.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_distribute_with_wiremock
    test_id = "transfer.ledger.distribute.0"

    @client.transfer.ledger.distribute(
      from_ledger_id: "from_ledger_id",
      to_ledger_id: "to_ledger_id",
      amount: "amount",
      idempotency_key: "idempotency_key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.distribute.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/distribute",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_distribute_throws_bad_request_error_with_wiremock
    test_id = "transfer.ledger.distribute.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.distribute(
        from_ledger_id: "from_ledger_id",
        to_ledger_id: "to_ledger_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.distribute.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/distribute",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_distribute_throws_unauthorized_error_with_wiremock
    test_id = "transfer.ledger.distribute.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.ledger.distribute(
        from_ledger_id: "from_ledger_id",
        to_ledger_id: "to_ledger_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.distribute.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/distribute",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_distribute_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.ledger.distribute.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.distribute(
        from_ledger_id: "from_ledger_id",
        to_ledger_id: "to_ledger_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.distribute.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/distribute",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_distribute_throws_internal_server_error_with_wiremock
    test_id = "transfer.ledger.distribute.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.ledger.distribute(
        from_ledger_id: "from_ledger_id",
        to_ledger_id: "to_ledger_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.distribute.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/distribute",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_distribute_throws_client_request_error_with_wiremock
    test_id = "transfer.ledger.distribute.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.distribute(
        from_ledger_id: "from_ledger_id",
        to_ledger_id: "to_ledger_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.distribute.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/distribute",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_distribute_throws_server_error_with_wiremock
    test_id = "transfer.ledger.distribute.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.ledger.distribute(
        from_ledger_id: "from_ledger_id",
        to_ledger_id: "to_ledger_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.distribute.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/distribute",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_deposit_with_wiremock
    test_id = "transfer.ledger.deposit.0"

    @client.transfer.ledger.deposit(
      amount: "amount",
      idempotency_key: "idempotency_key",
      network: "ach",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.deposit.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/deposit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_deposit_throws_bad_request_error_with_wiremock
    test_id = "transfer.ledger.deposit.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.deposit(
        amount: "amount",
        idempotency_key: "idempotency_key",
        network: "ach",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.deposit.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/deposit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_deposit_throws_unauthorized_error_with_wiremock
    test_id = "transfer.ledger.deposit.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.ledger.deposit(
        amount: "amount",
        idempotency_key: "idempotency_key",
        network: "ach",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.deposit.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/deposit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_deposit_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.ledger.deposit.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.deposit(
        amount: "amount",
        idempotency_key: "idempotency_key",
        network: "ach",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.deposit.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/deposit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_deposit_throws_internal_server_error_with_wiremock
    test_id = "transfer.ledger.deposit.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.ledger.deposit(
        amount: "amount",
        idempotency_key: "idempotency_key",
        network: "ach",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.deposit.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/deposit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_deposit_throws_client_request_error_with_wiremock
    test_id = "transfer.ledger.deposit.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.deposit(
        amount: "amount",
        idempotency_key: "idempotency_key",
        network: "ach",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.deposit.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/deposit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_deposit_throws_server_error_with_wiremock
    test_id = "transfer.ledger.deposit.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.ledger.deposit(
        amount: "amount",
        idempotency_key: "idempotency_key",
        network: "ach",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.deposit.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/deposit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_withdraw_with_wiremock
    test_id = "transfer.ledger.withdraw.0"

    @client.transfer.ledger.withdraw(
      amount: "amount",
      idempotency_key: "idempotency_key",
      network: "ach",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.withdraw.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/withdraw",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_withdraw_throws_bad_request_error_with_wiremock
    test_id = "transfer.ledger.withdraw.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.withdraw(
        amount: "amount",
        idempotency_key: "idempotency_key",
        network: "ach",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.withdraw.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/withdraw",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_withdraw_throws_unauthorized_error_with_wiremock
    test_id = "transfer.ledger.withdraw.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.ledger.withdraw(
        amount: "amount",
        idempotency_key: "idempotency_key",
        network: "ach",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.withdraw.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/withdraw",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_withdraw_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.ledger.withdraw.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.withdraw(
        amount: "amount",
        idempotency_key: "idempotency_key",
        network: "ach",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.withdraw.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/withdraw",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_withdraw_throws_internal_server_error_with_wiremock
    test_id = "transfer.ledger.withdraw.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.ledger.withdraw(
        amount: "amount",
        idempotency_key: "idempotency_key",
        network: "ach",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.withdraw.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/withdraw",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_withdraw_throws_client_request_error_with_wiremock
    test_id = "transfer.ledger.withdraw.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.withdraw(
        amount: "amount",
        idempotency_key: "idempotency_key",
        network: "ach",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.withdraw.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/withdraw",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_withdraw_throws_server_error_with_wiremock
    test_id = "transfer.ledger.withdraw.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.ledger.withdraw(
        amount: "amount",
        idempotency_key: "idempotency_key",
        network: "ach",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.ledger.withdraw.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/withdraw",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_list_events_with_wiremock
    test_id = "transfer.ledger.list_events.0"

    result = @client.transfer.ledger.list_events(request_options: {
      additional_headers: {
        "X-Test-Id" => "transfer.ledger.list_events.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_list_events_throws_bad_request_error_with_wiremock
    test_id = "transfer.ledger.list_events.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.list_events(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.list_events.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_list_events_throws_unauthorized_error_with_wiremock
    test_id = "transfer.ledger.list_events.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.ledger.list_events(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.list_events.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_list_events_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.ledger.list_events.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.list_events(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.list_events.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_list_events_throws_internal_server_error_with_wiremock
    test_id = "transfer.ledger.list_events.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.ledger.list_events(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.list_events.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_list_events_throws_client_request_error_with_wiremock
    test_id = "transfer.ledger.list_events.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.ledger.list_events(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.list_events.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/event/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_ledger_list_events_throws_server_error_with_wiremock
    test_id = "transfer.ledger.list_events.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.ledger.list_events(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.ledger.list_events.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/ledger/event/list",
      query_params: nil,
      expected: 1
    )
  end
end
