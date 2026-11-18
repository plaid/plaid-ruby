# frozen_string_literal: true

require_relative "wiremock_test_case"

class SandboxWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_sandbox_create_transactions_with_wiremock
    test_id = "sandbox.create_transactions.0"

    @client.sandbox.create_transactions(
      access_token: "access_token",
      transactions: [{
        date_transacted: "2023-01-15",
        date_posted: "2023-01-15",
        amount: 1.1,
        description: "description"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.create_transactions.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      expected: {
        "/transactions/0/amount" => 1.1
      }
    )
  end

  def test_sandbox_create_transactions_throws_bad_request_error_with_wiremock
    test_id = "sandbox.create_transactions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.create_transactions(
        access_token: "access_token",
        transactions: [{
          date_transacted: "2023-01-15",
          date_posted: "2023-01-15",
          amount: 1.1,
          description: "description"
        }, {
          date_transacted: "2023-01-15",
          date_posted: "2023-01-15",
          amount: 1.1,
          description: "description"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_transactions.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      expected: {
        "/transactions/0/amount" => 1.1,
        "/transactions/1/amount" => 1.1
      }
    )
  end

  def test_sandbox_create_transactions_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.create_transactions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.create_transactions(
        access_token: "access_token",
        transactions: [{
          date_transacted: "2023-01-15",
          date_posted: "2023-01-15",
          amount: 1.1,
          description: "description"
        }, {
          date_transacted: "2023-01-15",
          date_posted: "2023-01-15",
          amount: 1.1,
          description: "description"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_transactions.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      expected: {
        "/transactions/0/amount" => 1.1,
        "/transactions/1/amount" => 1.1
      }
    )
  end

  def test_sandbox_create_transactions_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.create_transactions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.create_transactions(
        access_token: "access_token",
        transactions: [{
          date_transacted: "2023-01-15",
          date_posted: "2023-01-15",
          amount: 1.1,
          description: "description"
        }, {
          date_transacted: "2023-01-15",
          date_posted: "2023-01-15",
          amount: 1.1,
          description: "description"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_transactions.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      expected: {
        "/transactions/0/amount" => 1.1,
        "/transactions/1/amount" => 1.1
      }
    )
  end

  def test_sandbox_create_transactions_throws_internal_server_error_with_wiremock
    test_id = "sandbox.create_transactions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.create_transactions(
        access_token: "access_token",
        transactions: [{
          date_transacted: "2023-01-15",
          date_posted: "2023-01-15",
          amount: 1.1,
          description: "description"
        }, {
          date_transacted: "2023-01-15",
          date_posted: "2023-01-15",
          amount: 1.1,
          description: "description"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_transactions.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      expected: {
        "/transactions/0/amount" => 1.1,
        "/transactions/1/amount" => 1.1
      }
    )
  end

  def test_sandbox_create_transactions_throws_client_request_error_with_wiremock
    test_id = "sandbox.create_transactions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.create_transactions(
        access_token: "access_token",
        transactions: [{
          date_transacted: "2023-01-15",
          date_posted: "2023-01-15",
          amount: 1.1,
          description: "description"
        }, {
          date_transacted: "2023-01-15",
          date_posted: "2023-01-15",
          amount: 1.1,
          description: "description"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_transactions.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      expected: {
        "/transactions/0/amount" => 1.1,
        "/transactions/1/amount" => 1.1
      }
    )
  end

  def test_sandbox_create_transactions_throws_server_error_with_wiremock
    test_id = "sandbox.create_transactions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.create_transactions(
        access_token: "access_token",
        transactions: [{
          date_transacted: "2023-01-15",
          date_posted: "2023-01-15",
          amount: 1.1,
          description: "description"
        }, {
          date_transacted: "2023-01-15",
          date_posted: "2023-01-15",
          amount: 1.1,
          description: "description"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_transactions.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transactions/create",
      expected: {
        "/transactions/0/amount" => 1.1,
        "/transactions/1/amount" => 1.1
      }
    )
  end

  def test_sandbox_create_processor_token_with_wiremock
    test_id = "sandbox.create_processor_token.0"

    @client.sandbox.create_processor_token(
      institution_id: "institution_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.create_processor_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_processor_token_throws_bad_request_error_with_wiremock
    test_id = "sandbox.create_processor_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.create_processor_token(
        institution_id: "institution_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_processor_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_processor_token_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.create_processor_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.create_processor_token(
        institution_id: "institution_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_processor_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_processor_token_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.create_processor_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.create_processor_token(
        institution_id: "institution_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_processor_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_processor_token_throws_internal_server_error_with_wiremock
    test_id = "sandbox.create_processor_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.create_processor_token(
        institution_id: "institution_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_processor_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_processor_token_throws_client_request_error_with_wiremock
    test_id = "sandbox.create_processor_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.create_processor_token(
        institution_id: "institution_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_processor_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_processor_token_throws_server_error_with_wiremock
    test_id = "sandbox.create_processor_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.create_processor_token(
        institution_id: "institution_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_processor_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_public_token_with_wiremock
    test_id = "sandbox.create_public_token.0"

    @client.sandbox.create_public_token(
      institution_id: "institution_id",
      initial_products: ["assets"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.create_public_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_public_token_throws_bad_request_error_with_wiremock
    test_id = "sandbox.create_public_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.create_public_token(
        institution_id: "institution_id",
        initial_products: %w[assets assets],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_public_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_public_token_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.create_public_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.create_public_token(
        institution_id: "institution_id",
        initial_products: %w[assets assets],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_public_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_public_token_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.create_public_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.create_public_token(
        institution_id: "institution_id",
        initial_products: %w[assets assets],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_public_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_public_token_throws_internal_server_error_with_wiremock
    test_id = "sandbox.create_public_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.create_public_token(
        institution_id: "institution_id",
        initial_products: %w[assets assets],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_public_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_public_token_throws_client_request_error_with_wiremock
    test_id = "sandbox.create_public_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.create_public_token(
        institution_id: "institution_id",
        initial_products: %w[assets assets],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_public_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_public_token_throws_server_error_with_wiremock
    test_id = "sandbox.create_public_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.create_public_token(
        institution_id: "institution_id",
        initial_products: %w[assets assets],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.create_public_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_item_webhook_with_wiremock
    test_id = "sandbox.fire_item_webhook.0"

    @client.sandbox.fire_item_webhook(
      access_token: "access_token",
      webhook_code: "DEFAULT_UPDATE",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.fire_item_webhook.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_item_webhook_throws_bad_request_error_with_wiremock
    test_id = "sandbox.fire_item_webhook.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_item_webhook(
        access_token: "access_token",
        webhook_code: "DEFAULT_UPDATE",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_item_webhook.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_item_webhook_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.fire_item_webhook.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.fire_item_webhook(
        access_token: "access_token",
        webhook_code: "DEFAULT_UPDATE",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_item_webhook.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_item_webhook_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.fire_item_webhook.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_item_webhook(
        access_token: "access_token",
        webhook_code: "DEFAULT_UPDATE",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_item_webhook.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_item_webhook_throws_internal_server_error_with_wiremock
    test_id = "sandbox.fire_item_webhook.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.fire_item_webhook(
        access_token: "access_token",
        webhook_code: "DEFAULT_UPDATE",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_item_webhook.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_item_webhook_throws_client_request_error_with_wiremock
    test_id = "sandbox.fire_item_webhook.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_item_webhook(
        access_token: "access_token",
        webhook_code: "DEFAULT_UPDATE",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_item_webhook.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_item_webhook_throws_server_error_with_wiremock
    test_id = "sandbox.fire_item_webhook.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.fire_item_webhook(
        access_token: "access_token",
        webhook_code: "DEFAULT_UPDATE",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_item_webhook.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_user_webhook_with_wiremock
    test_id = "sandbox.fire_user_webhook.0"

    @client.sandbox.fire_user_webhook(
      webhook_type: "CHECK_REPORT",
      webhook_code: "USER_CHECK_REPORT_READY",
      webhook: "webhook",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.fire_user_webhook.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_user_webhook_throws_bad_request_error_with_wiremock
    test_id = "sandbox.fire_user_webhook.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_user_webhook(
        webhook_type: "CHECK_REPORT",
        webhook_code: "USER_CHECK_REPORT_READY",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_user_webhook.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_user_webhook_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.fire_user_webhook.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.fire_user_webhook(
        webhook_type: "CHECK_REPORT",
        webhook_code: "USER_CHECK_REPORT_READY",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_user_webhook.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_user_webhook_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.fire_user_webhook.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_user_webhook(
        webhook_type: "CHECK_REPORT",
        webhook_code: "USER_CHECK_REPORT_READY",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_user_webhook.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_user_webhook_throws_internal_server_error_with_wiremock
    test_id = "sandbox.fire_user_webhook.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.fire_user_webhook(
        webhook_type: "CHECK_REPORT",
        webhook_code: "USER_CHECK_REPORT_READY",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_user_webhook.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_user_webhook_throws_client_request_error_with_wiremock
    test_id = "sandbox.fire_user_webhook.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_user_webhook(
        webhook_type: "CHECK_REPORT",
        webhook_code: "USER_CHECK_REPORT_READY",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_user_webhook.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_user_webhook_throws_server_error_with_wiremock
    test_id = "sandbox.fire_user_webhook.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.fire_user_webhook(
        webhook_type: "CHECK_REPORT",
        webhook_code: "USER_CHECK_REPORT_READY",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_user_webhook.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_item_login_with_wiremock
    test_id = "sandbox.reset_item_login.0"

    @client.sandbox.reset_item_login(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.reset_item_login.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_item_login_throws_bad_request_error_with_wiremock
    test_id = "sandbox.reset_item_login.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.reset_item_login(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.reset_item_login.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_item_login_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.reset_item_login.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.reset_item_login(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.reset_item_login.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_item_login_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.reset_item_login.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.reset_item_login(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.reset_item_login.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_item_login_throws_internal_server_error_with_wiremock
    test_id = "sandbox.reset_item_login.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.reset_item_login(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.reset_item_login.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_item_login_throws_client_request_error_with_wiremock
    test_id = "sandbox.reset_item_login.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.reset_item_login(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.reset_item_login.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_item_login_throws_server_error_with_wiremock
    test_id = "sandbox.reset_item_login.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.reset_item_login(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.reset_item_login.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_item_application_with_wiremock
    test_id = "sandbox.seed_item_application.0"

    @client.sandbox.seed_item_application(
      access_token: "access_token",
      application_id: "application_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.seed_item_application.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/application/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_item_application_throws_bad_request_error_with_wiremock
    test_id = "sandbox.seed_item_application.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.seed_item_application(
        access_token: "access_token",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.seed_item_application.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/application/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_item_application_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.seed_item_application.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.seed_item_application(
        access_token: "access_token",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.seed_item_application.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/application/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_item_application_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.seed_item_application.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.seed_item_application(
        access_token: "access_token",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.seed_item_application.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/application/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_item_application_throws_internal_server_error_with_wiremock
    test_id = "sandbox.seed_item_application.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.seed_item_application(
        access_token: "access_token",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.seed_item_application.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/application/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_item_application_throws_client_request_error_with_wiremock
    test_id = "sandbox.seed_item_application.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.seed_item_application(
        access_token: "access_token",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.seed_item_application.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/application/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_item_application_throws_server_error_with_wiremock
    test_id = "sandbox.seed_item_application.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.seed_item_application(
        access_token: "access_token",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.seed_item_application.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/application/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_fdx_consent_with_wiremock
    test_id = "sandbox.seed_fdx_consent.0"

    @client.sandbox.seed_fdx_consent(
      customer_id: "customer_id",
      application_id: "application_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.seed_fdx_consent.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/fdx/consent/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_fdx_consent_throws_bad_request_error_with_wiremock
    test_id = "sandbox.seed_fdx_consent.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.seed_fdx_consent(
        customer_id: "customer_id",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.seed_fdx_consent.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/fdx/consent/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_fdx_consent_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.seed_fdx_consent.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.seed_fdx_consent(
        customer_id: "customer_id",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.seed_fdx_consent.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/fdx/consent/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_fdx_consent_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.seed_fdx_consent.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.seed_fdx_consent(
        customer_id: "customer_id",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.seed_fdx_consent.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/fdx/consent/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_fdx_consent_throws_internal_server_error_with_wiremock
    test_id = "sandbox.seed_fdx_consent.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.seed_fdx_consent(
        customer_id: "customer_id",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.seed_fdx_consent.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/fdx/consent/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_fdx_consent_throws_client_request_error_with_wiremock
    test_id = "sandbox.seed_fdx_consent.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.seed_fdx_consent(
        customer_id: "customer_id",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.seed_fdx_consent.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/fdx/consent/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_seed_fdx_consent_throws_server_error_with_wiremock
    test_id = "sandbox.seed_fdx_consent.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.seed_fdx_consent(
        customer_id: "customer_id",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.seed_fdx_consent.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/fdx/consent/seed",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_set_item_verification_status_with_wiremock
    test_id = "sandbox.set_item_verification_status.0"

    @client.sandbox.set_item_verification_status(
      access_token: "access_token",
      account_id: "account_id",
      verification_status: "automatically_verified",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.set_item_verification_status.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/set_verification_status",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_set_item_verification_status_throws_bad_request_error_with_wiremock
    test_id = "sandbox.set_item_verification_status.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.set_item_verification_status(
        access_token: "access_token",
        account_id: "account_id",
        verification_status: "automatically_verified",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.set_item_verification_status.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/set_verification_status",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_set_item_verification_status_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.set_item_verification_status.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.set_item_verification_status(
        access_token: "access_token",
        account_id: "account_id",
        verification_status: "automatically_verified",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.set_item_verification_status.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/set_verification_status",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_set_item_verification_status_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.set_item_verification_status.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.set_item_verification_status(
        access_token: "access_token",
        account_id: "account_id",
        verification_status: "automatically_verified",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.set_item_verification_status.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/set_verification_status",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_set_item_verification_status_throws_internal_server_error_with_wiremock
    test_id = "sandbox.set_item_verification_status.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.set_item_verification_status(
        access_token: "access_token",
        account_id: "account_id",
        verification_status: "automatically_verified",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.set_item_verification_status.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/set_verification_status",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_set_item_verification_status_throws_client_request_error_with_wiremock
    test_id = "sandbox.set_item_verification_status.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.set_item_verification_status(
        access_token: "access_token",
        account_id: "account_id",
        verification_status: "automatically_verified",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.set_item_verification_status.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/set_verification_status",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_set_item_verification_status_throws_server_error_with_wiremock
    test_id = "sandbox.set_item_verification_status.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.set_item_verification_status(
        access_token: "access_token",
        account_id: "account_id",
        verification_status: "automatically_verified",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.set_item_verification_status.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/item/set_verification_status",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_user_login_with_wiremock
    test_id = "sandbox.reset_user_login.0"

    @client.sandbox.reset_user_login(request_options: {
      additional_headers: {
        "X-Test-Id" => "sandbox.reset_user_login.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_user_login_throws_bad_request_error_with_wiremock
    test_id = "sandbox.reset_user_login.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.reset_user_login(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.reset_user_login.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_user_login_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.reset_user_login.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.reset_user_login(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.reset_user_login.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_user_login_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.reset_user_login.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.reset_user_login(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.reset_user_login.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_user_login_throws_internal_server_error_with_wiremock
    test_id = "sandbox.reset_user_login.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.reset_user_login(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.reset_user_login.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_user_login_throws_client_request_error_with_wiremock
    test_id = "sandbox.reset_user_login.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.reset_user_login(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.reset_user_login.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_user_login_throws_server_error_with_wiremock
    test_id = "sandbox.reset_user_login.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.reset_user_login(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.reset_user_login.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/user/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_bank_transfer_with_wiremock
    test_id = "sandbox.simulate_bank_transfer.0"

    @client.sandbox.simulate_bank_transfer(
      bank_transfer_id: "bank_transfer_id",
      event_type: "event_type",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_bank_transfer.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_bank_transfer_throws_bad_request_error_with_wiremock
    test_id = "sandbox.simulate_bank_transfer.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_bank_transfer(
        bank_transfer_id: "bank_transfer_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_bank_transfer.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_bank_transfer_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.simulate_bank_transfer.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.simulate_bank_transfer(
        bank_transfer_id: "bank_transfer_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_bank_transfer.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_bank_transfer_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.simulate_bank_transfer.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_bank_transfer(
        bank_transfer_id: "bank_transfer_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_bank_transfer.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_bank_transfer_throws_internal_server_error_with_wiremock
    test_id = "sandbox.simulate_bank_transfer.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_bank_transfer(
        bank_transfer_id: "bank_transfer_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_bank_transfer.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_bank_transfer_throws_client_request_error_with_wiremock
    test_id = "sandbox.simulate_bank_transfer.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_bank_transfer(
        bank_transfer_id: "bank_transfer_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_bank_transfer.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_bank_transfer_throws_server_error_with_wiremock
    test_id = "sandbox.simulate_bank_transfer.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_bank_transfer(
        bank_transfer_id: "bank_transfer_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_bank_transfer.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_sweep_with_wiremock
    test_id = "sandbox.simulate_transfer_sweep.0"

    @client.sandbox.simulate_transfer_sweep(request_options: {
      additional_headers: {
        "X-Test-Id" => "sandbox.simulate_transfer_sweep.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/sweep/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_sweep_throws_bad_request_error_with_wiremock
    test_id = "sandbox.simulate_transfer_sweep.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_sweep(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_sweep.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/sweep/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_sweep_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.simulate_transfer_sweep.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.simulate_transfer_sweep(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_sweep.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/sweep/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_sweep_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.simulate_transfer_sweep.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_sweep(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_sweep.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/sweep/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_sweep_throws_internal_server_error_with_wiremock
    test_id = "sandbox.simulate_transfer_sweep.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_transfer_sweep(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_sweep.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/sweep/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_sweep_throws_client_request_error_with_wiremock
    test_id = "sandbox.simulate_transfer_sweep.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_sweep(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_sweep.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/sweep/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_sweep_throws_server_error_with_wiremock
    test_id = "sandbox.simulate_transfer_sweep.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_transfer_sweep(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_sweep.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/sweep/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_with_wiremock
    test_id = "sandbox.simulate_transfer.0"

    @client.sandbox.simulate_transfer(
      transfer_id: "transfer_id",
      event_type: "event_type",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_throws_bad_request_error_with_wiremock
    test_id = "sandbox.simulate_transfer.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer(
        transfer_id: "transfer_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.simulate_transfer.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.simulate_transfer(
        transfer_id: "transfer_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.simulate_transfer.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer(
        transfer_id: "transfer_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_throws_internal_server_error_with_wiremock
    test_id = "sandbox.simulate_transfer.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_transfer(
        transfer_id: "transfer_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_throws_client_request_error_with_wiremock
    test_id = "sandbox.simulate_transfer.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer(
        transfer_id: "transfer_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_throws_server_error_with_wiremock
    test_id = "sandbox.simulate_transfer.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_transfer(
        transfer_id: "transfer_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_refund_with_wiremock
    test_id = "sandbox.simulate_transfer_refund.0"

    @client.sandbox.simulate_transfer_refund(
      refund_id: "refund_id",
      event_type: "event_type",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_refund.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/refund/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_refund_throws_bad_request_error_with_wiremock
    test_id = "sandbox.simulate_transfer_refund.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_refund(
        refund_id: "refund_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_refund.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/refund/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_refund_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.simulate_transfer_refund.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.simulate_transfer_refund(
        refund_id: "refund_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_refund.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/refund/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_refund_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.simulate_transfer_refund.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_refund(
        refund_id: "refund_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_refund.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/refund/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_refund_throws_internal_server_error_with_wiremock
    test_id = "sandbox.simulate_transfer_refund.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_transfer_refund(
        refund_id: "refund_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_refund.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/refund/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_refund_throws_client_request_error_with_wiremock
    test_id = "sandbox.simulate_transfer_refund.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_refund(
        refund_id: "refund_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_refund.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/refund/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_refund_throws_server_error_with_wiremock
    test_id = "sandbox.simulate_transfer_refund.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_transfer_refund(
        refund_id: "refund_id",
        event_type: "event_type",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_refund.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/refund/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_available_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_available.0"

    @client.sandbox.simulate_transfer_ledger_available(request_options: {
      additional_headers: {
        "X-Test-Id" => "sandbox.simulate_transfer_ledger_available.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/simulate_available",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_available_throws_bad_request_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_available.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_ledger_available(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_ledger_available.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/simulate_available",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_available_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_available.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.simulate_transfer_ledger_available(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_ledger_available.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/simulate_available",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_available_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_available.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_ledger_available(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_ledger_available.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/simulate_available",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_available_throws_internal_server_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_available.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_transfer_ledger_available(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_ledger_available.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/simulate_available",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_available_throws_client_request_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_available.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_ledger_available(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_ledger_available.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/simulate_available",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_available_throws_server_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_available.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_transfer_ledger_available(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_ledger_available.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/simulate_available",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_deposit_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_deposit.0"

    @client.sandbox.simulate_transfer_ledger_deposit(
      sweep_id: "sweep_id",
      event_type: "sweep.posted",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_ledger_deposit.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/deposit/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_deposit_throws_bad_request_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_deposit.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_ledger_deposit(
        sweep_id: "sweep_id",
        event_type: "sweep.posted",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_ledger_deposit.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/deposit/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_deposit_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_deposit.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.simulate_transfer_ledger_deposit(
        sweep_id: "sweep_id",
        event_type: "sweep.posted",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_ledger_deposit.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/deposit/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_deposit_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_deposit.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_ledger_deposit(
        sweep_id: "sweep_id",
        event_type: "sweep.posted",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_ledger_deposit.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/deposit/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_deposit_throws_internal_server_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_deposit.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_transfer_ledger_deposit(
        sweep_id: "sweep_id",
        event_type: "sweep.posted",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_ledger_deposit.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/deposit/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_deposit_throws_client_request_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_deposit.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_ledger_deposit(
        sweep_id: "sweep_id",
        event_type: "sweep.posted",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_ledger_deposit.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/deposit/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_deposit_throws_server_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_deposit.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_transfer_ledger_deposit(
        sweep_id: "sweep_id",
        event_type: "sweep.posted",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_ledger_deposit.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/deposit/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_withdraw_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_withdraw.0"

    @client.sandbox.simulate_transfer_ledger_withdraw(
      sweep_id: "sweep_id",
      event_type: "sweep.posted",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_transfer_ledger_withdraw.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/withdraw/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_withdraw_throws_bad_request_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_withdraw.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_ledger_withdraw(
        sweep_id: "sweep_id",
        event_type: "sweep.posted",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_ledger_withdraw.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/withdraw/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_withdraw_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_withdraw.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.simulate_transfer_ledger_withdraw(
        sweep_id: "sweep_id",
        event_type: "sweep.posted",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_ledger_withdraw.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/withdraw/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_withdraw_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_withdraw.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_ledger_withdraw(
        sweep_id: "sweep_id",
        event_type: "sweep.posted",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_ledger_withdraw.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/withdraw/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_withdraw_throws_internal_server_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_withdraw.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_transfer_ledger_withdraw(
        sweep_id: "sweep_id",
        event_type: "sweep.posted",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_ledger_withdraw.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/withdraw/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_withdraw_throws_client_request_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_withdraw.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_transfer_ledger_withdraw(
        sweep_id: "sweep_id",
        event_type: "sweep.posted",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_ledger_withdraw.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/withdraw/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_transfer_ledger_withdraw_throws_server_error_with_wiremock
    test_id = "sandbox.simulate_transfer_ledger_withdraw.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_transfer_ledger_withdraw(
        sweep_id: "sweep_id",
        event_type: "sweep.posted",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_transfer_ledger_withdraw.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/ledger/withdraw/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_transfer_webhook_with_wiremock
    test_id = "sandbox.fire_transfer_webhook.0"

    @client.sandbox.fire_transfer_webhook(
      webhook: "webhook",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.fire_transfer_webhook.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_transfer_webhook_throws_bad_request_error_with_wiremock
    test_id = "sandbox.fire_transfer_webhook.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_transfer_webhook(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_transfer_webhook.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_transfer_webhook_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.fire_transfer_webhook.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.fire_transfer_webhook(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_transfer_webhook.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_transfer_webhook_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.fire_transfer_webhook.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_transfer_webhook(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_transfer_webhook.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_transfer_webhook_throws_internal_server_error_with_wiremock
    test_id = "sandbox.fire_transfer_webhook.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.fire_transfer_webhook(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_transfer_webhook.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_transfer_webhook_throws_client_request_error_with_wiremock
    test_id = "sandbox.fire_transfer_webhook.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_transfer_webhook(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_transfer_webhook.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_transfer_webhook_throws_server_error_with_wiremock
    test_id = "sandbox.fire_transfer_webhook.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.fire_transfer_webhook(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_transfer_webhook.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_transfer_test_clock_with_wiremock
    test_id = "sandbox.create_transfer_test_clock.0"

    @client.sandbox.create_transfer_test_clock(request_options: {
      additional_headers: {
        "X-Test-Id" => "sandbox.create_transfer_test_clock.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_transfer_test_clock_throws_bad_request_error_with_wiremock
    test_id = "sandbox.create_transfer_test_clock.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.create_transfer_test_clock(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.create_transfer_test_clock.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_transfer_test_clock_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.create_transfer_test_clock.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.create_transfer_test_clock(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.create_transfer_test_clock.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_transfer_test_clock_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.create_transfer_test_clock.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.create_transfer_test_clock(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.create_transfer_test_clock.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_transfer_test_clock_throws_internal_server_error_with_wiremock
    test_id = "sandbox.create_transfer_test_clock.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.create_transfer_test_clock(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.create_transfer_test_clock.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_transfer_test_clock_throws_client_request_error_with_wiremock
    test_id = "sandbox.create_transfer_test_clock.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.create_transfer_test_clock(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.create_transfer_test_clock.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_create_transfer_test_clock_throws_server_error_with_wiremock
    test_id = "sandbox.create_transfer_test_clock.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.create_transfer_test_clock(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.create_transfer_test_clock.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_advance_transfer_test_clock_with_wiremock
    test_id = "sandbox.advance_transfer_test_clock.0"

    @client.sandbox.advance_transfer_test_clock(
      test_clock_id: "test_clock_id",
      new_virtual_time: "2024-01-15T09:30:00Z",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.advance_transfer_test_clock.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/advance",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_advance_transfer_test_clock_throws_bad_request_error_with_wiremock
    test_id = "sandbox.advance_transfer_test_clock.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.advance_transfer_test_clock(
        test_clock_id: "test_clock_id",
        new_virtual_time: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.advance_transfer_test_clock.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/advance",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_advance_transfer_test_clock_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.advance_transfer_test_clock.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.advance_transfer_test_clock(
        test_clock_id: "test_clock_id",
        new_virtual_time: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.advance_transfer_test_clock.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/advance",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_advance_transfer_test_clock_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.advance_transfer_test_clock.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.advance_transfer_test_clock(
        test_clock_id: "test_clock_id",
        new_virtual_time: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.advance_transfer_test_clock.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/advance",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_advance_transfer_test_clock_throws_internal_server_error_with_wiremock
    test_id = "sandbox.advance_transfer_test_clock.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.advance_transfer_test_clock(
        test_clock_id: "test_clock_id",
        new_virtual_time: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.advance_transfer_test_clock.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/advance",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_advance_transfer_test_clock_throws_client_request_error_with_wiremock
    test_id = "sandbox.advance_transfer_test_clock.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.advance_transfer_test_clock(
        test_clock_id: "test_clock_id",
        new_virtual_time: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.advance_transfer_test_clock.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/advance",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_advance_transfer_test_clock_throws_server_error_with_wiremock
    test_id = "sandbox.advance_transfer_test_clock.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.advance_transfer_test_clock(
        test_clock_id: "test_clock_id",
        new_virtual_time: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.advance_transfer_test_clock.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/advance",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_get_transfer_test_clock_with_wiremock
    test_id = "sandbox.get_transfer_test_clock.0"

    @client.sandbox.get_transfer_test_clock(
      test_clock_id: "test_clock_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.get_transfer_test_clock.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_get_transfer_test_clock_throws_bad_request_error_with_wiremock
    test_id = "sandbox.get_transfer_test_clock.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.get_transfer_test_clock(
        test_clock_id: "test_clock_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.get_transfer_test_clock.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_get_transfer_test_clock_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.get_transfer_test_clock.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.get_transfer_test_clock(
        test_clock_id: "test_clock_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.get_transfer_test_clock.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_get_transfer_test_clock_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.get_transfer_test_clock.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.get_transfer_test_clock(
        test_clock_id: "test_clock_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.get_transfer_test_clock.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_get_transfer_test_clock_throws_internal_server_error_with_wiremock
    test_id = "sandbox.get_transfer_test_clock.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.get_transfer_test_clock(
        test_clock_id: "test_clock_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.get_transfer_test_clock.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_get_transfer_test_clock_throws_client_request_error_with_wiremock
    test_id = "sandbox.get_transfer_test_clock.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.get_transfer_test_clock(
        test_clock_id: "test_clock_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.get_transfer_test_clock.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_get_transfer_test_clock_throws_server_error_with_wiremock
    test_id = "sandbox.get_transfer_test_clock.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.get_transfer_test_clock(
        test_clock_id: "test_clock_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.get_transfer_test_clock.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_list_transfer_test_clocks_with_wiremock
    test_id = "sandbox.list_transfer_test_clocks.0"

    result = @client.sandbox.list_transfer_test_clocks(request_options: {
      additional_headers: {
        "X-Test-Id" => "sandbox.list_transfer_test_clocks.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_list_transfer_test_clocks_throws_bad_request_error_with_wiremock
    test_id = "sandbox.list_transfer_test_clocks.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.list_transfer_test_clocks(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.list_transfer_test_clocks.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_list_transfer_test_clocks_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.list_transfer_test_clocks.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.list_transfer_test_clocks(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.list_transfer_test_clocks.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_list_transfer_test_clocks_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.list_transfer_test_clocks.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.list_transfer_test_clocks(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.list_transfer_test_clocks.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_list_transfer_test_clocks_throws_internal_server_error_with_wiremock
    test_id = "sandbox.list_transfer_test_clocks.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.list_transfer_test_clocks(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.list_transfer_test_clocks.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_list_transfer_test_clocks_throws_client_request_error_with_wiremock
    test_id = "sandbox.list_transfer_test_clocks.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.list_transfer_test_clocks(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.list_transfer_test_clocks.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_list_transfer_test_clocks_throws_server_error_with_wiremock
    test_id = "sandbox.list_transfer_test_clocks.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.list_transfer_test_clocks(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.list_transfer_test_clocks.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/transfer/test_clock/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_payment_profile_login_with_wiremock
    test_id = "sandbox.reset_payment_profile_login.0"

    @client.sandbox.reset_payment_profile_login(
      payment_profile_token: "payment_profile_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.reset_payment_profile_login.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment_profile/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_payment_profile_login_throws_bad_request_error_with_wiremock
    test_id = "sandbox.reset_payment_profile_login.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.reset_payment_profile_login(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.reset_payment_profile_login.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment_profile/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_payment_profile_login_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.reset_payment_profile_login.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.reset_payment_profile_login(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.reset_payment_profile_login.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment_profile/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_payment_profile_login_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.reset_payment_profile_login.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.reset_payment_profile_login(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.reset_payment_profile_login.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment_profile/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_payment_profile_login_throws_internal_server_error_with_wiremock
    test_id = "sandbox.reset_payment_profile_login.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.reset_payment_profile_login(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.reset_payment_profile_login.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment_profile/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_payment_profile_login_throws_client_request_error_with_wiremock
    test_id = "sandbox.reset_payment_profile_login.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.reset_payment_profile_login(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.reset_payment_profile_login.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment_profile/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_reset_payment_profile_login_throws_server_error_with_wiremock
    test_id = "sandbox.reset_payment_profile_login.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.reset_payment_profile_login(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.reset_payment_profile_login.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment_profile/reset_login",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_payment_with_wiremock
    test_id = "sandbox.simulate_payment.0"

    @client.sandbox.simulate_payment(
      payment_id: "payment_id",
      webhook: "webhook",
      status: "status",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_payment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_payment_throws_bad_request_error_with_wiremock
    test_id = "sandbox.simulate_payment.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_payment(
        payment_id: "payment_id",
        webhook: "webhook",
        status: "status",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_payment.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_payment_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.simulate_payment.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.simulate_payment(
        payment_id: "payment_id",
        webhook: "webhook",
        status: "status",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_payment.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_payment_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.simulate_payment.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_payment(
        payment_id: "payment_id",
        webhook: "webhook",
        status: "status",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_payment.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_payment_throws_internal_server_error_with_wiremock
    test_id = "sandbox.simulate_payment.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_payment(
        payment_id: "payment_id",
        webhook: "webhook",
        status: "status",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_payment.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_payment_throws_client_request_error_with_wiremock
    test_id = "sandbox.simulate_payment.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_payment(
        payment_id: "payment_id",
        webhook: "webhook",
        status: "status",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_payment.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_payment_throws_server_error_with_wiremock
    test_id = "sandbox.simulate_payment.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_payment(
        payment_id: "payment_id",
        webhook: "webhook",
        status: "status",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_payment.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/payment/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_transfer_webhook_with_wiremock
    test_id = "sandbox.fire_bank_transfer_webhook.0"

    @client.sandbox.fire_bank_transfer_webhook(
      webhook: "webhook",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.fire_bank_transfer_webhook.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_transfer_webhook_throws_bad_request_error_with_wiremock
    test_id = "sandbox.fire_bank_transfer_webhook.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_bank_transfer_webhook(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_bank_transfer_webhook.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_transfer_webhook_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.fire_bank_transfer_webhook.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.fire_bank_transfer_webhook(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_bank_transfer_webhook.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_transfer_webhook_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.fire_bank_transfer_webhook.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_bank_transfer_webhook(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_bank_transfer_webhook.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_transfer_webhook_throws_internal_server_error_with_wiremock
    test_id = "sandbox.fire_bank_transfer_webhook.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.fire_bank_transfer_webhook(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_bank_transfer_webhook.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_transfer_webhook_throws_client_request_error_with_wiremock
    test_id = "sandbox.fire_bank_transfer_webhook.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_bank_transfer_webhook(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_bank_transfer_webhook.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_transfer_webhook_throws_server_error_with_wiremock
    test_id = "sandbox.fire_bank_transfer_webhook.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.fire_bank_transfer_webhook(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_bank_transfer_webhook.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_transfer/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_income_webhook_with_wiremock
    test_id = "sandbox.fire_income_webhook.0"

    @client.sandbox.fire_income_webhook(
      item_id: "item_id",
      webhook: "webhook",
      webhook_code: "INCOME_VERIFICATION",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.fire_income_webhook.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_income_webhook_throws_bad_request_error_with_wiremock
    test_id = "sandbox.fire_income_webhook.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_income_webhook(
        item_id: "item_id",
        webhook: "webhook",
        webhook_code: "INCOME_VERIFICATION",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_income_webhook.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_income_webhook_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.fire_income_webhook.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.fire_income_webhook(
        item_id: "item_id",
        webhook: "webhook",
        webhook_code: "INCOME_VERIFICATION",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_income_webhook.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_income_webhook_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.fire_income_webhook.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_income_webhook(
        item_id: "item_id",
        webhook: "webhook",
        webhook_code: "INCOME_VERIFICATION",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_income_webhook.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_income_webhook_throws_internal_server_error_with_wiremock
    test_id = "sandbox.fire_income_webhook.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.fire_income_webhook(
        item_id: "item_id",
        webhook: "webhook",
        webhook_code: "INCOME_VERIFICATION",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_income_webhook.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_income_webhook_throws_client_request_error_with_wiremock
    test_id = "sandbox.fire_income_webhook.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_income_webhook(
        item_id: "item_id",
        webhook: "webhook",
        webhook_code: "INCOME_VERIFICATION",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_income_webhook.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_income_webhook_throws_server_error_with_wiremock
    test_id = "sandbox.fire_income_webhook.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.fire_income_webhook(
        item_id: "item_id",
        webhook: "webhook",
        webhook_code: "INCOME_VERIFICATION",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_income_webhook.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_income_webhook_with_wiremock
    test_id = "sandbox.fire_bank_income_webhook.0"

    @client.sandbox.fire_bank_income_webhook(
      webhook_code: "BANK_INCOME_REFRESH_UPDATE",
      webhook_fields: {
        user_id: "user_id"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.fire_bank_income_webhook.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_income_webhook_throws_bad_request_error_with_wiremock
    test_id = "sandbox.fire_bank_income_webhook.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_bank_income_webhook(
        webhook_code: "BANK_INCOME_REFRESH_UPDATE",
        webhook_fields: {
          user_id: "user_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_bank_income_webhook.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_income_webhook_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.fire_bank_income_webhook.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.fire_bank_income_webhook(
        webhook_code: "BANK_INCOME_REFRESH_UPDATE",
        webhook_fields: {
          user_id: "user_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_bank_income_webhook.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_income_webhook_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.fire_bank_income_webhook.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_bank_income_webhook(
        webhook_code: "BANK_INCOME_REFRESH_UPDATE",
        webhook_fields: {
          user_id: "user_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_bank_income_webhook.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_income_webhook_throws_internal_server_error_with_wiremock
    test_id = "sandbox.fire_bank_income_webhook.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.fire_bank_income_webhook(
        webhook_code: "BANK_INCOME_REFRESH_UPDATE",
        webhook_fields: {
          user_id: "user_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_bank_income_webhook.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_income_webhook_throws_client_request_error_with_wiremock
    test_id = "sandbox.fire_bank_income_webhook.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.fire_bank_income_webhook(
        webhook_code: "BANK_INCOME_REFRESH_UPDATE",
        webhook_fields: {
          user_id: "user_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_bank_income_webhook.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_fire_bank_income_webhook_throws_server_error_with_wiremock
    test_id = "sandbox.fire_bank_income_webhook.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.fire_bank_income_webhook(
        webhook_code: "BANK_INCOME_REFRESH_UPDATE",
        webhook_fields: {
          user_id: "user_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.fire_bank_income_webhook.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/bank_income/fire_webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_update_cra_cashflow_updates_with_wiremock
    test_id = "sandbox.update_cra_cashflow_updates.0"

    @client.sandbox.update_cra_cashflow_updates(request_options: {
      additional_headers: {
        "X-Test-Id" => "sandbox.update_cra_cashflow_updates.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/cashflow_updates/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_update_cra_cashflow_updates_throws_bad_request_error_with_wiremock
    test_id = "sandbox.update_cra_cashflow_updates.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.update_cra_cashflow_updates(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.update_cra_cashflow_updates.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/cashflow_updates/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_update_cra_cashflow_updates_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.update_cra_cashflow_updates.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.update_cra_cashflow_updates(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.update_cra_cashflow_updates.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/cashflow_updates/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_update_cra_cashflow_updates_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.update_cra_cashflow_updates.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.update_cra_cashflow_updates(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.update_cra_cashflow_updates.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/cashflow_updates/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_update_cra_cashflow_updates_throws_internal_server_error_with_wiremock
    test_id = "sandbox.update_cra_cashflow_updates.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.update_cra_cashflow_updates(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.update_cra_cashflow_updates.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/cashflow_updates/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_update_cra_cashflow_updates_throws_client_request_error_with_wiremock
    test_id = "sandbox.update_cra_cashflow_updates.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.update_cra_cashflow_updates(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.update_cra_cashflow_updates.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/cashflow_updates/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_update_cra_cashflow_updates_throws_server_error_with_wiremock
    test_id = "sandbox.update_cra_cashflow_updates.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.update_cra_cashflow_updates(request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.update_cra_cashflow_updates.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/cashflow_updates/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_cra_servicing_with_wiremock
    test_id = "sandbox.simulate_cra_servicing.0"

    @client.sandbox.simulate_cra_servicing(
      subscription_id: "subscription_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.simulate_cra_servicing.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/servicing/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_cra_servicing_throws_bad_request_error_with_wiremock
    test_id = "sandbox.simulate_cra_servicing.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_cra_servicing(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_cra_servicing.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/servicing/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_cra_servicing_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.simulate_cra_servicing.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.simulate_cra_servicing(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_cra_servicing.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/servicing/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_cra_servicing_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.simulate_cra_servicing.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_cra_servicing(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_cra_servicing.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/servicing/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_cra_servicing_throws_internal_server_error_with_wiremock
    test_id = "sandbox.simulate_cra_servicing.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_cra_servicing(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_cra_servicing.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/servicing/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_cra_servicing_throws_client_request_error_with_wiremock
    test_id = "sandbox.simulate_cra_servicing.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.simulate_cra_servicing(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_cra_servicing.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/servicing/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_simulate_cra_servicing_throws_server_error_with_wiremock
    test_id = "sandbox.simulate_cra_servicing.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.simulate_cra_servicing(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.simulate_cra_servicing.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/cra/servicing/simulate",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_select_oauth_accounts_with_wiremock
    test_id = "sandbox.select_oauth_accounts.0"

    @client.sandbox.select_oauth_accounts(
      oauth_state_id: "oauth_state_id",
      accounts: ["accounts"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "sandbox.select_oauth_accounts.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/oauth/select_accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_select_oauth_accounts_throws_bad_request_error_with_wiremock
    test_id = "sandbox.select_oauth_accounts.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.select_oauth_accounts(
        oauth_state_id: "oauth_state_id",
        accounts: %w[accounts accounts],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.select_oauth_accounts.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/oauth/select_accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_select_oauth_accounts_throws_unauthorized_error_with_wiremock
    test_id = "sandbox.select_oauth_accounts.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.sandbox.select_oauth_accounts(
        oauth_state_id: "oauth_state_id",
        accounts: %w[accounts accounts],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.select_oauth_accounts.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/oauth/select_accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_select_oauth_accounts_throws_too_many_requests_error_with_wiremock
    test_id = "sandbox.select_oauth_accounts.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.select_oauth_accounts(
        oauth_state_id: "oauth_state_id",
        accounts: %w[accounts accounts],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.select_oauth_accounts.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/oauth/select_accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_select_oauth_accounts_throws_internal_server_error_with_wiremock
    test_id = "sandbox.select_oauth_accounts.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.select_oauth_accounts(
        oauth_state_id: "oauth_state_id",
        accounts: %w[accounts accounts],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.select_oauth_accounts.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/oauth/select_accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_select_oauth_accounts_throws_client_request_error_with_wiremock
    test_id = "sandbox.select_oauth_accounts.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.sandbox.select_oauth_accounts(
        oauth_state_id: "oauth_state_id",
        accounts: %w[accounts accounts],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.select_oauth_accounts.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/oauth/select_accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_sandbox_select_oauth_accounts_throws_server_error_with_wiremock
    test_id = "sandbox.select_oauth_accounts.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.sandbox.select_oauth_accounts(
        oauth_state_id: "oauth_state_id",
        accounts: %w[accounts accounts],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "sandbox.select_oauth_accounts.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/sandbox/oauth/select_accounts",
      query_params: nil,
      expected: 1
    )
  end
end
