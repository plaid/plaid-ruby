# frozen_string_literal: true

require_relative "wiremock_test_case"

class WalletWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_wallet_create_with_wiremock
    test_id = "wallet.create.0"

    result = @client.wallet.create(
      iso_currency_code: "GBP",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/create",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/balance/current" => 123.12,
        "/balance/available" => 100.96
      }
    )
  end

  def test_wallet_create_throws_bad_request_error_with_wiremock
    test_id = "wallet.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.create(
        iso_currency_code: "GBP",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_create_throws_unauthorized_error_with_wiremock
    test_id = "wallet.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.wallet.create(
        iso_currency_code: "GBP",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_create_throws_too_many_requests_error_with_wiremock
    test_id = "wallet.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.create(
        iso_currency_code: "GBP",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_create_throws_internal_server_error_with_wiremock
    test_id = "wallet.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.wallet.create(
        iso_currency_code: "GBP",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_create_throws_client_request_error_with_wiremock
    test_id = "wallet.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.create(
        iso_currency_code: "GBP",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_create_throws_server_error_with_wiremock
    test_id = "wallet.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.wallet.create(
        iso_currency_code: "GBP",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_get_with_wiremock
    test_id = "wallet.get.0"

    result = @client.wallet.get(
      wallet_id: "wallet_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/balance/current" => 123.12,
        "/balance/available" => 100.96
      }
    )
  end

  def test_wallet_get_example2_with_wiremock
    test_id = "wallet.get.1"

    result = @client.wallet.get(
      wallet_id: "wallet_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.get.1"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/balance/current" => 123.12,
        "/balance/available" => 100.96
      }
    )
  end

  def test_wallet_get_throws_bad_request_error_with_wiremock
    test_id = "wallet.get.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.get(
        wallet_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.get.2"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_get_throws_unauthorized_error_with_wiremock
    test_id = "wallet.get.3"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.wallet.get(
        wallet_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.get.3"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_get_throws_too_many_requests_error_with_wiremock
    test_id = "wallet.get.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.get(
        wallet_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.get.4"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_get_throws_internal_server_error_with_wiremock
    test_id = "wallet.get.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.wallet.get(
        wallet_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.get.5"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_get_throws_client_request_error_with_wiremock
    test_id = "wallet.get.6"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.get(
        wallet_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.get.6"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_get_throws_server_error_with_wiremock
    test_id = "wallet.get.7"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.wallet.get(
        wallet_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.get.7"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_with_wiremock
    test_id = "wallet.list.0"

    result = @client.wallet.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "wallet.list.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_throws_bad_request_error_with_wiremock
    test_id = "wallet.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.list.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_throws_unauthorized_error_with_wiremock
    test_id = "wallet.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.wallet.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.list.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_throws_too_many_requests_error_with_wiremock
    test_id = "wallet.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.list.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_throws_internal_server_error_with_wiremock
    test_id = "wallet.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.wallet.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.list.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_throws_client_request_error_with_wiremock
    test_id = "wallet.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.list.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_throws_server_error_with_wiremock
    test_id = "wallet.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.wallet.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.list.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_execute_transaction_with_wiremock
    test_id = "wallet.execute_transaction.0"

    @client.wallet.execute_transaction(
      idempotency_key: "idempotency_key",
      wallet_id: "wallet_id",
      counterparty: {
        name: "name",
        numbers: {}
      },
      amount: {
        iso_currency_code: "GBP",
        value: 1.1
      },
      reference: "reference",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.execute_transaction.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_wallet_execute_transaction_throws_bad_request_error_with_wiremock
    test_id = "wallet.execute_transaction.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.execute_transaction(
        idempotency_key: "x",
        wallet_id: "x",
        counterparty: {
          name: "x",
          numbers: {}
        },
        amount: {
          iso_currency_code: "GBP",
          value: 0.01
        },
        reference: "banana",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.execute_transaction.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      expected: {
        "/amount/value" => 0.01
      }
    )
  end

  def test_wallet_execute_transaction_throws_unauthorized_error_with_wiremock
    test_id = "wallet.execute_transaction.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.wallet.execute_transaction(
        idempotency_key: "x",
        wallet_id: "x",
        counterparty: {
          name: "x",
          numbers: {}
        },
        amount: {
          iso_currency_code: "GBP",
          value: 0.01
        },
        reference: "banana",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.execute_transaction.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      expected: {
        "/amount/value" => 0.01
      }
    )
  end

  def test_wallet_execute_transaction_throws_too_many_requests_error_with_wiremock
    test_id = "wallet.execute_transaction.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.execute_transaction(
        idempotency_key: "x",
        wallet_id: "x",
        counterparty: {
          name: "x",
          numbers: {}
        },
        amount: {
          iso_currency_code: "GBP",
          value: 0.01
        },
        reference: "banana",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.execute_transaction.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      expected: {
        "/amount/value" => 0.01
      }
    )
  end

  def test_wallet_execute_transaction_throws_internal_server_error_with_wiremock
    test_id = "wallet.execute_transaction.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.wallet.execute_transaction(
        idempotency_key: "x",
        wallet_id: "x",
        counterparty: {
          name: "x",
          numbers: {}
        },
        amount: {
          iso_currency_code: "GBP",
          value: 0.01
        },
        reference: "banana",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.execute_transaction.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      expected: {
        "/amount/value" => 0.01
      }
    )
  end

  def test_wallet_execute_transaction_throws_client_request_error_with_wiremock
    test_id = "wallet.execute_transaction.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.execute_transaction(
        idempotency_key: "x",
        wallet_id: "x",
        counterparty: {
          name: "x",
          numbers: {}
        },
        amount: {
          iso_currency_code: "GBP",
          value: 0.01
        },
        reference: "banana",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.execute_transaction.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      expected: {
        "/amount/value" => 0.01
      }
    )
  end

  def test_wallet_execute_transaction_throws_server_error_with_wiremock
    test_id = "wallet.execute_transaction.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.wallet.execute_transaction(
        idempotency_key: "x",
        wallet_id: "x",
        counterparty: {
          name: "x",
          numbers: {}
        },
        amount: {
          iso_currency_code: "GBP",
          value: 0.01
        },
        reference: "banana",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.execute_transaction.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/execute",
      expected: {
        "/amount/value" => 0.01
      }
    )
  end

  def test_wallet_get_transaction_with_wiremock
    test_id = "wallet.get_transaction.0"

    result = @client.wallet.get_transaction(
      transaction_id: "transaction_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.get_transaction.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/amount/value" => 123.12,
        "/error/status" => 1
      }
    )
  end

  def test_wallet_get_transaction_example2_with_wiremock
    test_id = "wallet.get_transaction.1"

    result = @client.wallet.get_transaction(
      transaction_id: "transaction_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.get_transaction.1"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/amount/value" => 456.78,
        "/error/status" => 1
      }
    )
  end

  def test_wallet_get_transaction_throws_bad_request_error_with_wiremock
    test_id = "wallet.get_transaction.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.get_transaction(
        transaction_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.get_transaction.2"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_get_transaction_throws_unauthorized_error_with_wiremock
    test_id = "wallet.get_transaction.3"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.wallet.get_transaction(
        transaction_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.get_transaction.3"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_get_transaction_throws_too_many_requests_error_with_wiremock
    test_id = "wallet.get_transaction.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.get_transaction(
        transaction_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.get_transaction.4"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_get_transaction_throws_internal_server_error_with_wiremock
    test_id = "wallet.get_transaction.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.wallet.get_transaction(
        transaction_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.get_transaction.5"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_get_transaction_throws_client_request_error_with_wiremock
    test_id = "wallet.get_transaction.6"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.get_transaction(
        transaction_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.get_transaction.6"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_get_transaction_throws_server_error_with_wiremock
    test_id = "wallet.get_transaction.7"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.wallet.get_transaction(
        transaction_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.get_transaction.7"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_transactions_with_wiremock
    test_id = "wallet.list_transactions.0"

    result = @client.wallet.list_transactions(
      wallet_id: "wallet_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "wallet.list_transactions.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_transactions_throws_bad_request_error_with_wiremock
    test_id = "wallet.list_transactions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.list_transactions(
        wallet_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.list_transactions.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_transactions_throws_unauthorized_error_with_wiremock
    test_id = "wallet.list_transactions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.wallet.list_transactions(
        wallet_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.list_transactions.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_transactions_throws_too_many_requests_error_with_wiremock
    test_id = "wallet.list_transactions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.list_transactions(
        wallet_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.list_transactions.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_transactions_throws_internal_server_error_with_wiremock
    test_id = "wallet.list_transactions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.wallet.list_transactions(
        wallet_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.list_transactions.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_transactions_throws_client_request_error_with_wiremock
    test_id = "wallet.list_transactions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.wallet.list_transactions(
        wallet_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.list_transactions.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_wallet_list_transactions_throws_server_error_with_wiremock
    test_id = "wallet.list_transactions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.wallet.list_transactions(
        wallet_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "wallet.list_transactions.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/wallet/transaction/list",
      query_params: nil,
      expected: 1
    )
  end
end
