# frozen_string_literal: true

require_relative "wiremock_test_case"

class TransferWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_transfer_get_with_wiremock
    test_id = "transfer.get.0"

    result = @client.transfer.get(request_options: {
      additional_headers: {
        "X-Test-Id" => "transfer.get.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/transfer/guarantee_details/schedule/0/observation_window_business_days" => 1
      }
    )
  end

  def test_transfer_get_throws_bad_request_error_with_wiremock
    test_id = "transfer.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.get.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_get_throws_unauthorized_error_with_wiremock
    test_id = "transfer.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.get.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_get_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.get.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_get_throws_internal_server_error_with_wiremock
    test_id = "transfer.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.get.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_get_throws_client_request_error_with_wiremock
    test_id = "transfer.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.get.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_get_throws_server_error_with_wiremock
    test_id = "transfer.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.get.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_create_with_wiremock
    test_id = "transfer.create.0"

    result = @client.transfer.create(
      access_token: "access_token",
      account_id: "account_id",
      authorization_id: "authorization_id",
      description: "description",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/create",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/transfer/guarantee_details/schedule/0/observation_window_business_days" => 1
      }
    )
  end

  def test_transfer_create_throws_bad_request_error_with_wiremock
    test_id = "transfer.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.create(
        access_token: "access_token",
        account_id: "account_id",
        authorization_id: "authorization_id",
        description: "description",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_create_throws_unauthorized_error_with_wiremock
    test_id = "transfer.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.create(
        access_token: "access_token",
        account_id: "account_id",
        authorization_id: "authorization_id",
        description: "description",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_create_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.create(
        access_token: "access_token",
        account_id: "account_id",
        authorization_id: "authorization_id",
        description: "description",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_create_throws_internal_server_error_with_wiremock
    test_id = "transfer.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.create(
        access_token: "access_token",
        account_id: "account_id",
        authorization_id: "authorization_id",
        description: "description",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_create_throws_client_request_error_with_wiremock
    test_id = "transfer.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.create(
        access_token: "access_token",
        account_id: "account_id",
        authorization_id: "authorization_id",
        description: "description",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_create_throws_server_error_with_wiremock
    test_id = "transfer.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.create(
        access_token: "access_token",
        account_id: "account_id",
        authorization_id: "authorization_id",
        description: "description",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_list_with_wiremock
    test_id = "transfer.list.0"

    result = @client.transfer.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "transfer.list.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_list_throws_bad_request_error_with_wiremock
    test_id = "transfer.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.list.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_list_throws_unauthorized_error_with_wiremock
    test_id = "transfer.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.list.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_list_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.list.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_list_throws_internal_server_error_with_wiremock
    test_id = "transfer.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.list.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_list_throws_client_request_error_with_wiremock
    test_id = "transfer.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.list.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_list_throws_server_error_with_wiremock
    test_id = "transfer.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.list.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_cancel_with_wiremock
    test_id = "transfer.cancel.0"

    @client.transfer.cancel(
      transfer_id: "transfer_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.cancel.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_cancel_throws_bad_request_error_with_wiremock
    test_id = "transfer.cancel.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.cancel(
        transfer_id: "transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.cancel.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_cancel_throws_unauthorized_error_with_wiremock
    test_id = "transfer.cancel.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.cancel(
        transfer_id: "transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.cancel.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_cancel_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.cancel.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.cancel(
        transfer_id: "transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.cancel.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_cancel_throws_internal_server_error_with_wiremock
    test_id = "transfer.cancel.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.cancel(
        transfer_id: "transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.cancel.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_cancel_throws_client_request_error_with_wiremock
    test_id = "transfer.cancel.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.cancel(
        transfer_id: "transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.cancel.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_cancel_throws_server_error_with_wiremock
    test_id = "transfer.cancel.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.cancel(
        transfer_id: "transfer_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.cancel.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_migrate_account_with_wiremock
    test_id = "transfer.migrate_account.0"

    @client.transfer.migrate_account(
      account_number: "account_number",
      routing_number: "routing_number",
      account_type: "account_type",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.migrate_account.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_migrate_account_throws_bad_request_error_with_wiremock
    test_id = "transfer.migrate_account.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.migrate_account(
        account_number: "account_number",
        routing_number: "routing_number",
        account_type: "account_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.migrate_account.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_migrate_account_throws_unauthorized_error_with_wiremock
    test_id = "transfer.migrate_account.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.migrate_account(
        account_number: "account_number",
        routing_number: "routing_number",
        account_type: "account_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.migrate_account.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_migrate_account_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.migrate_account.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.migrate_account(
        account_number: "account_number",
        routing_number: "routing_number",
        account_type: "account_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.migrate_account.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_migrate_account_throws_internal_server_error_with_wiremock
    test_id = "transfer.migrate_account.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.migrate_account(
        account_number: "account_number",
        routing_number: "routing_number",
        account_type: "account_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.migrate_account.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_migrate_account_throws_client_request_error_with_wiremock
    test_id = "transfer.migrate_account.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.migrate_account(
        account_number: "account_number",
        routing_number: "routing_number",
        account_type: "account_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.migrate_account.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_migrate_account_throws_server_error_with_wiremock
    test_id = "transfer.migrate_account.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.migrate_account(
        account_number: "account_number",
        routing_number: "routing_number",
        account_type: "account_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.migrate_account.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/migrate_account",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recover_return_with_wiremock
    test_id = "transfer.recover_return.0"

    @client.transfer.recover_return(
      transfer_id: "transfer_id",
      amount: "amount",
      idempotency_key: "idempotency_key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.recover_return.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/return/recover",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recover_return_throws_bad_request_error_with_wiremock
    test_id = "transfer.recover_return.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recover_return(
        transfer_id: "transfer_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recover_return.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/return/recover",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recover_return_throws_unauthorized_error_with_wiremock
    test_id = "transfer.recover_return.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.recover_return(
        transfer_id: "transfer_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recover_return.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/return/recover",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recover_return_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.recover_return.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recover_return(
        transfer_id: "transfer_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recover_return.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/return/recover",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recover_return_throws_internal_server_error_with_wiremock
    test_id = "transfer.recover_return.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.recover_return(
        transfer_id: "transfer_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recover_return.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/return/recover",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recover_return_throws_client_request_error_with_wiremock
    test_id = "transfer.recover_return.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.recover_return(
        transfer_id: "transfer_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recover_return.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/return/recover",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_recover_return_throws_server_error_with_wiremock
    test_id = "transfer.recover_return.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.recover_return(
        transfer_id: "transfer_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.recover_return.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/return/recover",
      query_params: nil,
      expected: 1
    )
  end
end
