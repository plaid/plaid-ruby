# frozen_string_literal: true

require_relative "wiremock_test_case"

class TransferRefundWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_transfer_refund_create_with_wiremock
    test_id = "transfer.refund.create.0"

    @client.transfer.refund.create(
      transfer_id: "transfer_id",
      amount: "amount",
      idempotency_key: "idempotency_key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.refund.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_create_throws_bad_request_error_with_wiremock
    test_id = "transfer.refund.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.refund.create(
        transfer_id: "transfer_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_create_throws_unauthorized_error_with_wiremock
    test_id = "transfer.refund.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.refund.create(
        transfer_id: "transfer_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_create_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.refund.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.refund.create(
        transfer_id: "transfer_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_create_throws_internal_server_error_with_wiremock
    test_id = "transfer.refund.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.refund.create(
        transfer_id: "transfer_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_create_throws_client_request_error_with_wiremock
    test_id = "transfer.refund.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.refund.create(
        transfer_id: "transfer_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_create_throws_server_error_with_wiremock
    test_id = "transfer.refund.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.refund.create(
        transfer_id: "transfer_id",
        amount: "amount",
        idempotency_key: "idempotency_key",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_get_with_wiremock
    test_id = "transfer.refund.get.0"

    @client.transfer.refund.get(
      refund_id: "refund_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.refund.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_get_throws_bad_request_error_with_wiremock
    test_id = "transfer.refund.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.refund.get(
        refund_id: "refund_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_get_throws_unauthorized_error_with_wiremock
    test_id = "transfer.refund.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.refund.get(
        refund_id: "refund_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_get_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.refund.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.refund.get(
        refund_id: "refund_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_get_throws_internal_server_error_with_wiremock
    test_id = "transfer.refund.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.refund.get(
        refund_id: "refund_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_get_throws_client_request_error_with_wiremock
    test_id = "transfer.refund.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.refund.get(
        refund_id: "refund_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_get_throws_server_error_with_wiremock
    test_id = "transfer.refund.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.refund.get(
        refund_id: "refund_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_cancel_with_wiremock
    test_id = "transfer.refund.cancel.0"

    @client.transfer.refund.cancel(
      refund_id: "refund_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.refund.cancel.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_cancel_throws_bad_request_error_with_wiremock
    test_id = "transfer.refund.cancel.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.refund.cancel(
        refund_id: "refund_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.cancel.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_cancel_throws_unauthorized_error_with_wiremock
    test_id = "transfer.refund.cancel.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.refund.cancel(
        refund_id: "refund_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.cancel.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_cancel_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.refund.cancel.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.refund.cancel(
        refund_id: "refund_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.cancel.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_cancel_throws_internal_server_error_with_wiremock
    test_id = "transfer.refund.cancel.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.refund.cancel(
        refund_id: "refund_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.cancel.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_cancel_throws_client_request_error_with_wiremock
    test_id = "transfer.refund.cancel.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.refund.cancel(
        refund_id: "refund_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.cancel.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_refund_cancel_throws_server_error_with_wiremock
    test_id = "transfer.refund.cancel.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.refund.cancel(
        refund_id: "refund_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.refund.cancel.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/refund/cancel",
      query_params: nil,
      expected: 1
    )
  end
end
