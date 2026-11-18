# frozen_string_literal: true

require_relative "wiremock_test_case"

class TransferAuthorizationWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_transfer_authorization_create_with_wiremock
    test_id = "transfer.authorization.create.0"

    result = @client.transfer.authorization.create(
      access_token: "access_token",
      account_id: "account_id",
      type: "debit",
      network: "ach",
      amount: "amount",
      user: {
        legal_name: "legal_name"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.authorization.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/create",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/authorization/guarantee_details/schedule/0/observation_window_business_days" => 1
      }
    )
  end

  def test_transfer_authorization_create_throws_bad_request_error_with_wiremock
    test_id = "transfer.authorization.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.authorization.create(
        access_token: "access_token",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.authorization.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_authorization_create_throws_unauthorized_error_with_wiremock
    test_id = "transfer.authorization.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.authorization.create(
        access_token: "access_token",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.authorization.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_authorization_create_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.authorization.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.authorization.create(
        access_token: "access_token",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.authorization.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_authorization_create_throws_internal_server_error_with_wiremock
    test_id = "transfer.authorization.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.authorization.create(
        access_token: "access_token",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.authorization.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_authorization_create_throws_client_request_error_with_wiremock
    test_id = "transfer.authorization.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.authorization.create(
        access_token: "access_token",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.authorization.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_authorization_create_throws_server_error_with_wiremock
    test_id = "transfer.authorization.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.authorization.create(
        access_token: "access_token",
        account_id: "account_id",
        type: "debit",
        network: "ach",
        amount: "amount",
        user: {
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.authorization.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_authorization_cancel_with_wiremock
    test_id = "transfer.authorization.cancel.0"

    @client.transfer.authorization.cancel(
      authorization_id: "authorization_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.authorization.cancel.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_authorization_cancel_throws_bad_request_error_with_wiremock
    test_id = "transfer.authorization.cancel.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.authorization.cancel(
        authorization_id: "authorization_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.authorization.cancel.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_authorization_cancel_throws_unauthorized_error_with_wiremock
    test_id = "transfer.authorization.cancel.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.authorization.cancel(
        authorization_id: "authorization_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.authorization.cancel.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_authorization_cancel_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.authorization.cancel.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.authorization.cancel(
        authorization_id: "authorization_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.authorization.cancel.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_authorization_cancel_throws_internal_server_error_with_wiremock
    test_id = "transfer.authorization.cancel.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.authorization.cancel(
        authorization_id: "authorization_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.authorization.cancel.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_authorization_cancel_throws_client_request_error_with_wiremock
    test_id = "transfer.authorization.cancel.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.authorization.cancel(
        authorization_id: "authorization_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.authorization.cancel.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_authorization_cancel_throws_server_error_with_wiremock
    test_id = "transfer.authorization.cancel.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.authorization.cancel(
        authorization_id: "authorization_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.authorization.cancel.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/authorization/cancel",
      query_params: nil,
      expected: 1
    )
  end
end
