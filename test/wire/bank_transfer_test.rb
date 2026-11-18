# frozen_string_literal: true

require_relative "wiremock_test_case"

class BankTransferWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_bank_transfer_get_with_wiremock
    test_id = "bank_transfer.get.0"

    @client.bank_transfer.get(
      bank_transfer_id: "bank_transfer_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_get_throws_bad_request_error_with_wiremock
    test_id = "bank_transfer.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.get(
        bank_transfer_id: "bank_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_get_throws_unauthorized_error_with_wiremock
    test_id = "bank_transfer.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.bank_transfer.get(
        bank_transfer_id: "bank_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_get_throws_too_many_requests_error_with_wiremock
    test_id = "bank_transfer.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.get(
        bank_transfer_id: "bank_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_get_throws_internal_server_error_with_wiremock
    test_id = "bank_transfer.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.get(
        bank_transfer_id: "bank_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_get_throws_client_request_error_with_wiremock
    test_id = "bank_transfer.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.get(
        bank_transfer_id: "bank_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_get_throws_server_error_with_wiremock
    test_id = "bank_transfer.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.get(
        bank_transfer_id: "bank_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_create_with_wiremock
    test_id = "bank_transfer.create.0"

    @client.bank_transfer.create(
      idempotency_key: "idempotency_key",
      access_token: "access_token",
      account_id: "account_id",
      type: "debit",
      network: "ach",
      amount: "amount",
      iso_currency_code: "iso_currency_code",
      description: "description",
      user: {
        legal_name: "legal_name"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_create_throws_bad_request_error_with_wiremock
    test_id = "bank_transfer.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.create(
        idempotency_key: "idempotency_key",
        access_token: "access_token",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        iso_currency_code: "iso_currency_code",
        description: "description",
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_create_throws_unauthorized_error_with_wiremock
    test_id = "bank_transfer.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.bank_transfer.create(
        idempotency_key: "idempotency_key",
        access_token: "access_token",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        iso_currency_code: "iso_currency_code",
        description: "description",
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_create_throws_too_many_requests_error_with_wiremock
    test_id = "bank_transfer.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.create(
        idempotency_key: "idempotency_key",
        access_token: "access_token",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        iso_currency_code: "iso_currency_code",
        description: "description",
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_create_throws_internal_server_error_with_wiremock
    test_id = "bank_transfer.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.create(
        idempotency_key: "idempotency_key",
        access_token: "access_token",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        iso_currency_code: "iso_currency_code",
        description: "description",
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_create_throws_client_request_error_with_wiremock
    test_id = "bank_transfer.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.create(
        idempotency_key: "idempotency_key",
        access_token: "access_token",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        iso_currency_code: "iso_currency_code",
        description: "description",
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_create_throws_server_error_with_wiremock
    test_id = "bank_transfer.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.create(
        idempotency_key: "idempotency_key",
        access_token: "access_token",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        iso_currency_code: "iso_currency_code",
        description: "description",
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_list_with_wiremock
    test_id = "bank_transfer.list.0"

    result = @client.bank_transfer.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "bank_transfer.list.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_list_throws_bad_request_error_with_wiremock
    test_id = "bank_transfer.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.list.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_list_throws_unauthorized_error_with_wiremock
    test_id = "bank_transfer.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.bank_transfer.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.list.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_list_throws_too_many_requests_error_with_wiremock
    test_id = "bank_transfer.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.list.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_list_throws_internal_server_error_with_wiremock
    test_id = "bank_transfer.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.list.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_list_throws_client_request_error_with_wiremock
    test_id = "bank_transfer.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.list.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_list_throws_server_error_with_wiremock
    test_id = "bank_transfer.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.list.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_cancel_with_wiremock
    test_id = "bank_transfer.cancel.0"

    @client.bank_transfer.cancel(
      bank_transfer_id: "bank_transfer_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.cancel.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_cancel_throws_bad_request_error_with_wiremock
    test_id = "bank_transfer.cancel.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.cancel(
        bank_transfer_id: "bank_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.cancel.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_cancel_throws_unauthorized_error_with_wiremock
    test_id = "bank_transfer.cancel.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.bank_transfer.cancel(
        bank_transfer_id: "bank_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.cancel.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_cancel_throws_too_many_requests_error_with_wiremock
    test_id = "bank_transfer.cancel.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.cancel(
        bank_transfer_id: "bank_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.cancel.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_cancel_throws_internal_server_error_with_wiremock
    test_id = "bank_transfer.cancel.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.cancel(
        bank_transfer_id: "bank_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.cancel.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_cancel_throws_client_request_error_with_wiremock
    test_id = "bank_transfer.cancel.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.cancel(
        bank_transfer_id: "bank_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.cancel.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_cancel_throws_server_error_with_wiremock
    test_id = "bank_transfer.cancel.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.cancel(
        bank_transfer_id: "bank_transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.cancel.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_migrate_account_with_wiremock
    test_id = "bank_transfer.migrate_account.0"

    @client.bank_transfer.migrate_account(
      account_number: "account_number",
      routing_number: "routing_number",
      account_type: "account_type",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer.migrate_account.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_migrate_account_throws_bad_request_error_with_wiremock
    test_id = "bank_transfer.migrate_account.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.migrate_account(
        account_number: "account_number",
        routing_number: "routing_number",
        account_type: "account_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.migrate_account.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_migrate_account_throws_unauthorized_error_with_wiremock
    test_id = "bank_transfer.migrate_account.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.bank_transfer.migrate_account(
        account_number: "account_number",
        routing_number: "routing_number",
        account_type: "account_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.migrate_account.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_migrate_account_throws_too_many_requests_error_with_wiremock
    test_id = "bank_transfer.migrate_account.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.migrate_account(
        account_number: "account_number",
        routing_number: "routing_number",
        account_type: "account_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.migrate_account.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_migrate_account_throws_internal_server_error_with_wiremock
    test_id = "bank_transfer.migrate_account.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.migrate_account(
        account_number: "account_number",
        routing_number: "routing_number",
        account_type: "account_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.migrate_account.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_migrate_account_throws_client_request_error_with_wiremock
    test_id = "bank_transfer.migrate_account.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.bank_transfer.migrate_account(
        account_number: "account_number",
        routing_number: "routing_number",
        account_type: "account_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.migrate_account.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_migrate_account_throws_server_error_with_wiremock
    test_id = "bank_transfer.migrate_account.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.bank_transfer.migrate_account(
        account_number: "account_number",
        routing_number: "routing_number",
        account_type: "account_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "bank_transfer.migrate_account.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank_transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end
end
