# frozen_string_literal: true

require_relative "wiremock_test_case"

class PaymentInitiationWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_payment_initiation_create_recipient_with_wiremock
    test_id = "payment_initiation.create_recipient.0"

    @client.payment_initiation.create_recipient(
      name: "name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.create_recipient.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_recipient_throws_bad_request_error_with_wiremock
    test_id = "payment_initiation.create_recipient.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.create_recipient(
        name: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_recipient.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_recipient_throws_unauthorized_error_with_wiremock
    test_id = "payment_initiation.create_recipient.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_initiation.create_recipient(
        name: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_recipient.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_recipient_throws_too_many_requests_error_with_wiremock
    test_id = "payment_initiation.create_recipient.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.create_recipient(
        name: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_recipient.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_recipient_throws_internal_server_error_with_wiremock
    test_id = "payment_initiation.create_recipient.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.create_recipient(
        name: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_recipient.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_recipient_throws_client_request_error_with_wiremock
    test_id = "payment_initiation.create_recipient.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.create_recipient(
        name: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_recipient.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_recipient_throws_server_error_with_wiremock
    test_id = "payment_initiation.create_recipient.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.create_recipient(
        name: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_recipient.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_reverse_payment_with_wiremock
    test_id = "payment_initiation.reverse_payment.0"

    @client.payment_initiation.reverse_payment(
      payment_id: "payment_id",
      idempotency_key: "idempotency_key",
      reference: "reference",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.reverse_payment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/reverse",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_reverse_payment_throws_bad_request_error_with_wiremock
    test_id = "payment_initiation.reverse_payment.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.reverse_payment(
        payment_id: "payment_id",
        idempotency_key: "x",
        reference: "banana",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.reverse_payment.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/reverse",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_reverse_payment_throws_unauthorized_error_with_wiremock
    test_id = "payment_initiation.reverse_payment.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_initiation.reverse_payment(
        payment_id: "payment_id",
        idempotency_key: "x",
        reference: "banana",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.reverse_payment.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/reverse",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_reverse_payment_throws_too_many_requests_error_with_wiremock
    test_id = "payment_initiation.reverse_payment.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.reverse_payment(
        payment_id: "payment_id",
        idempotency_key: "x",
        reference: "banana",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.reverse_payment.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/reverse",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_reverse_payment_throws_internal_server_error_with_wiremock
    test_id = "payment_initiation.reverse_payment.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.reverse_payment(
        payment_id: "payment_id",
        idempotency_key: "x",
        reference: "banana",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.reverse_payment.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/reverse",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_reverse_payment_throws_client_request_error_with_wiremock
    test_id = "payment_initiation.reverse_payment.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.reverse_payment(
        payment_id: "payment_id",
        idempotency_key: "x",
        reference: "banana",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.reverse_payment.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/reverse",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_reverse_payment_throws_server_error_with_wiremock
    test_id = "payment_initiation.reverse_payment.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.reverse_payment(
        payment_id: "payment_id",
        idempotency_key: "x",
        reference: "banana",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.reverse_payment.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/reverse",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_recipient_with_wiremock
    test_id = "payment_initiation.get_recipient.0"

    @client.payment_initiation.get_recipient(
      recipient_id: "recipient_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.get_recipient.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_recipient_throws_bad_request_error_with_wiremock
    test_id = "payment_initiation.get_recipient.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.get_recipient(
        recipient_id: "recipient_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_recipient.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_recipient_throws_unauthorized_error_with_wiremock
    test_id = "payment_initiation.get_recipient.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_initiation.get_recipient(
        recipient_id: "recipient_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_recipient.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_recipient_throws_too_many_requests_error_with_wiremock
    test_id = "payment_initiation.get_recipient.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.get_recipient(
        recipient_id: "recipient_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_recipient.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_recipient_throws_internal_server_error_with_wiremock
    test_id = "payment_initiation.get_recipient.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.get_recipient(
        recipient_id: "recipient_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_recipient.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_recipient_throws_client_request_error_with_wiremock
    test_id = "payment_initiation.get_recipient.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.get_recipient(
        recipient_id: "recipient_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_recipient.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_recipient_throws_server_error_with_wiremock
    test_id = "payment_initiation.get_recipient.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.get_recipient(
        recipient_id: "recipient_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_recipient.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_recipients_with_wiremock
    test_id = "payment_initiation.list_recipients.0"

    result = @client.payment_initiation.list_recipients(request_options: {
      additional_headers: {
        "X-Test-Id" => "payment_initiation.list_recipients.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_recipients_throws_bad_request_error_with_wiremock
    test_id = "payment_initiation.list_recipients.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.list_recipients(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.list_recipients.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_recipients_throws_unauthorized_error_with_wiremock
    test_id = "payment_initiation.list_recipients.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_initiation.list_recipients(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.list_recipients.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_recipients_throws_too_many_requests_error_with_wiremock
    test_id = "payment_initiation.list_recipients.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.list_recipients(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.list_recipients.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_recipients_throws_internal_server_error_with_wiremock
    test_id = "payment_initiation.list_recipients.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.list_recipients(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.list_recipients.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_recipients_throws_client_request_error_with_wiremock
    test_id = "payment_initiation.list_recipients.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.list_recipients(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.list_recipients.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_recipients_throws_server_error_with_wiremock
    test_id = "payment_initiation.list_recipients.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.list_recipients(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.list_recipients.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/recipient/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_payment_with_wiremock
    test_id = "payment_initiation.create_payment.0"

    @client.payment_initiation.create_payment(
      recipient_id: "recipient_id",
      reference: "reference",
      amount: {
        currency: "GBP",
        value: 1.1
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.create_payment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_payment_throws_bad_request_error_with_wiremock
    test_id = "payment_initiation.create_payment.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.create_payment(
        recipient_id: "recipient_id",
        reference: "x",
        amount: {
          currency: "GBP",
          value: 1.1
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_payment.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_payment_throws_unauthorized_error_with_wiremock
    test_id = "payment_initiation.create_payment.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_initiation.create_payment(
        recipient_id: "recipient_id",
        reference: "x",
        amount: {
          currency: "GBP",
          value: 1.1
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_payment.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_payment_throws_too_many_requests_error_with_wiremock
    test_id = "payment_initiation.create_payment.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.create_payment(
        recipient_id: "recipient_id",
        reference: "x",
        amount: {
          currency: "GBP",
          value: 1.1
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_payment.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_payment_throws_internal_server_error_with_wiremock
    test_id = "payment_initiation.create_payment.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.create_payment(
        recipient_id: "recipient_id",
        reference: "x",
        amount: {
          currency: "GBP",
          value: 1.1
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_payment.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_payment_throws_client_request_error_with_wiremock
    test_id = "payment_initiation.create_payment.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.create_payment(
        recipient_id: "recipient_id",
        reference: "x",
        amount: {
          currency: "GBP",
          value: 1.1
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_payment.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_payment_throws_server_error_with_wiremock
    test_id = "payment_initiation.create_payment.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.create_payment(
        recipient_id: "recipient_id",
        reference: "x",
        amount: {
          currency: "GBP",
          value: 1.1
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_payment.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/create",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_payment_token_with_wiremock
    test_id = "payment_initiation.create_payment_token.0"

    @client.payment_initiation.create_payment_token(
      payment_id: "payment_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.create_payment_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_payment_token_throws_bad_request_error_with_wiremock
    test_id = "payment_initiation.create_payment_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.create_payment_token(
        payment_id: "payment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_payment_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_payment_token_throws_unauthorized_error_with_wiremock
    test_id = "payment_initiation.create_payment_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_initiation.create_payment_token(
        payment_id: "payment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_payment_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_payment_token_throws_too_many_requests_error_with_wiremock
    test_id = "payment_initiation.create_payment_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.create_payment_token(
        payment_id: "payment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_payment_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_payment_token_throws_internal_server_error_with_wiremock
    test_id = "payment_initiation.create_payment_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.create_payment_token(
        payment_id: "payment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_payment_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_payment_token_throws_client_request_error_with_wiremock
    test_id = "payment_initiation.create_payment_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.create_payment_token(
        payment_id: "payment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_payment_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_payment_token_throws_server_error_with_wiremock
    test_id = "payment_initiation.create_payment_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.create_payment_token(
        payment_id: "payment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_payment_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_create_consent_with_wiremock
    test_id = "payment_initiation.create_consent.0"

    @client.payment_initiation.create_consent(
      recipient_id: "recipient_id",
      reference: "reference",
      constraints: {
        max_payment_amount: {
          currency: "GBP",
          value: 1.1
        },
        periodic_amounts: [{
          amount: {
            currency: "GBP",
            value: 1.1
          },
          interval: "DAY",
          alignment: "CALENDAR"
        }]
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.create_consent.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      expected: {
        "/constraints/max_payment_amount/value" => 1.1,
        "/constraints/periodic_amounts/0/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_consent_throws_bad_request_error_with_wiremock
    test_id = "payment_initiation.create_consent.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.create_consent(
        recipient_id: "recipient_id",
        reference: "x",
        constraints: {
          max_payment_amount: {
            currency: "GBP",
            value: 1.1
          },
          periodic_amounts: [{
            amount: {
              currency: "GBP",
              value: 1.1
            },
            interval: "DAY",
            alignment: "CALENDAR"
          }, {
            amount: {
              currency: "GBP",
              value: 1.1
            },
            interval: "DAY",
            alignment: "CALENDAR"
          }]
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_consent.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      expected: {
        "/constraints/max_payment_amount/value" => 1.1,
        "/constraints/periodic_amounts/0/amount/value" => 1.1,
        "/constraints/periodic_amounts/1/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_consent_throws_unauthorized_error_with_wiremock
    test_id = "payment_initiation.create_consent.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_initiation.create_consent(
        recipient_id: "recipient_id",
        reference: "x",
        constraints: {
          max_payment_amount: {
            currency: "GBP",
            value: 1.1
          },
          periodic_amounts: [{
            amount: {
              currency: "GBP",
              value: 1.1
            },
            interval: "DAY",
            alignment: "CALENDAR"
          }, {
            amount: {
              currency: "GBP",
              value: 1.1
            },
            interval: "DAY",
            alignment: "CALENDAR"
          }]
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_consent.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      expected: {
        "/constraints/max_payment_amount/value" => 1.1,
        "/constraints/periodic_amounts/0/amount/value" => 1.1,
        "/constraints/periodic_amounts/1/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_consent_throws_too_many_requests_error_with_wiremock
    test_id = "payment_initiation.create_consent.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.create_consent(
        recipient_id: "recipient_id",
        reference: "x",
        constraints: {
          max_payment_amount: {
            currency: "GBP",
            value: 1.1
          },
          periodic_amounts: [{
            amount: {
              currency: "GBP",
              value: 1.1
            },
            interval: "DAY",
            alignment: "CALENDAR"
          }, {
            amount: {
              currency: "GBP",
              value: 1.1
            },
            interval: "DAY",
            alignment: "CALENDAR"
          }]
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_consent.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      expected: {
        "/constraints/max_payment_amount/value" => 1.1,
        "/constraints/periodic_amounts/0/amount/value" => 1.1,
        "/constraints/periodic_amounts/1/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_consent_throws_internal_server_error_with_wiremock
    test_id = "payment_initiation.create_consent.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.create_consent(
        recipient_id: "recipient_id",
        reference: "x",
        constraints: {
          max_payment_amount: {
            currency: "GBP",
            value: 1.1
          },
          periodic_amounts: [{
            amount: {
              currency: "GBP",
              value: 1.1
            },
            interval: "DAY",
            alignment: "CALENDAR"
          }, {
            amount: {
              currency: "GBP",
              value: 1.1
            },
            interval: "DAY",
            alignment: "CALENDAR"
          }]
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_consent.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      expected: {
        "/constraints/max_payment_amount/value" => 1.1,
        "/constraints/periodic_amounts/0/amount/value" => 1.1,
        "/constraints/periodic_amounts/1/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_consent_throws_client_request_error_with_wiremock
    test_id = "payment_initiation.create_consent.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.create_consent(
        recipient_id: "recipient_id",
        reference: "x",
        constraints: {
          max_payment_amount: {
            currency: "GBP",
            value: 1.1
          },
          periodic_amounts: [{
            amount: {
              currency: "GBP",
              value: 1.1
            },
            interval: "DAY",
            alignment: "CALENDAR"
          }, {
            amount: {
              currency: "GBP",
              value: 1.1
            },
            interval: "DAY",
            alignment: "CALENDAR"
          }]
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_consent.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      expected: {
        "/constraints/max_payment_amount/value" => 1.1,
        "/constraints/periodic_amounts/0/amount/value" => 1.1,
        "/constraints/periodic_amounts/1/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_create_consent_throws_server_error_with_wiremock
    test_id = "payment_initiation.create_consent.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.create_consent(
        recipient_id: "recipient_id",
        reference: "x",
        constraints: {
          max_payment_amount: {
            currency: "GBP",
            value: 1.1
          },
          periodic_amounts: [{
            amount: {
              currency: "GBP",
              value: 1.1
            },
            interval: "DAY",
            alignment: "CALENDAR"
          }, {
            amount: {
              currency: "GBP",
              value: 1.1
            },
            interval: "DAY",
            alignment: "CALENDAR"
          }]
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.create_consent.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/create",
      expected: {
        "/constraints/max_payment_amount/value" => 1.1,
        "/constraints/periodic_amounts/0/amount/value" => 1.1,
        "/constraints/periodic_amounts/1/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_get_consent_with_wiremock
    test_id = "payment_initiation.get_consent.0"

    result = @client.payment_initiation.get_consent(
      consent_id: "consent_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.get_consent.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/constraints/max_payment_amount/value" => 100,
        "/constraints/periodic_amounts/0/amount/value" => 300
      }
    )
  end

  def test_payment_initiation_get_consent_throws_bad_request_error_with_wiremock
    test_id = "payment_initiation.get_consent.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.get_consent(
        consent_id: "consent_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_consent.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_consent_throws_unauthorized_error_with_wiremock
    test_id = "payment_initiation.get_consent.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_initiation.get_consent(
        consent_id: "consent_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_consent.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_consent_throws_too_many_requests_error_with_wiremock
    test_id = "payment_initiation.get_consent.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.get_consent(
        consent_id: "consent_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_consent.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_consent_throws_internal_server_error_with_wiremock
    test_id = "payment_initiation.get_consent.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.get_consent(
        consent_id: "consent_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_consent.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_consent_throws_client_request_error_with_wiremock
    test_id = "payment_initiation.get_consent.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.get_consent(
        consent_id: "consent_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_consent.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_consent_throws_server_error_with_wiremock
    test_id = "payment_initiation.get_consent.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.get_consent(
        consent_id: "consent_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_consent.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_revoke_consent_with_wiremock
    test_id = "payment_initiation.revoke_consent.0"

    @client.payment_initiation.revoke_consent(
      consent_id: "consent_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.revoke_consent.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_revoke_consent_throws_bad_request_error_with_wiremock
    test_id = "payment_initiation.revoke_consent.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.revoke_consent(
        consent_id: "consent_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.revoke_consent.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_revoke_consent_throws_unauthorized_error_with_wiremock
    test_id = "payment_initiation.revoke_consent.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_initiation.revoke_consent(
        consent_id: "consent_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.revoke_consent.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_revoke_consent_throws_too_many_requests_error_with_wiremock
    test_id = "payment_initiation.revoke_consent.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.revoke_consent(
        consent_id: "consent_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.revoke_consent.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_revoke_consent_throws_internal_server_error_with_wiremock
    test_id = "payment_initiation.revoke_consent.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.revoke_consent(
        consent_id: "consent_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.revoke_consent.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_revoke_consent_throws_client_request_error_with_wiremock
    test_id = "payment_initiation.revoke_consent.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.revoke_consent(
        consent_id: "consent_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.revoke_consent.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_revoke_consent_throws_server_error_with_wiremock
    test_id = "payment_initiation.revoke_consent.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.revoke_consent(
        consent_id: "consent_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.revoke_consent.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/revoke",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_execute_consent_payment_with_wiremock
    test_id = "payment_initiation.execute_consent_payment.0"

    result = @client.payment_initiation.execute_consent_payment(
      consent_id: "consent_id",
      amount: {
        currency: "GBP",
        value: 1.1
      },
      idempotency_key: "idempotency_key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.execute_consent_payment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      expected: {
        "/amount/value" => 1.1
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/error/status" => 1
      }
    )
  end

  def test_payment_initiation_execute_consent_payment_throws_bad_request_error_with_wiremock
    test_id = "payment_initiation.execute_consent_payment.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.execute_consent_payment(
        consent_id: "consent_id",
        amount: {
          currency: "GBP",
          value: 1.1
        },
        idempotency_key: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.execute_consent_payment.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_execute_consent_payment_throws_unauthorized_error_with_wiremock
    test_id = "payment_initiation.execute_consent_payment.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_initiation.execute_consent_payment(
        consent_id: "consent_id",
        amount: {
          currency: "GBP",
          value: 1.1
        },
        idempotency_key: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.execute_consent_payment.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_execute_consent_payment_throws_too_many_requests_error_with_wiremock
    test_id = "payment_initiation.execute_consent_payment.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.execute_consent_payment(
        consent_id: "consent_id",
        amount: {
          currency: "GBP",
          value: 1.1
        },
        idempotency_key: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.execute_consent_payment.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_execute_consent_payment_throws_internal_server_error_with_wiremock
    test_id = "payment_initiation.execute_consent_payment.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.execute_consent_payment(
        consent_id: "consent_id",
        amount: {
          currency: "GBP",
          value: 1.1
        },
        idempotency_key: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.execute_consent_payment.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_execute_consent_payment_throws_client_request_error_with_wiremock
    test_id = "payment_initiation.execute_consent_payment.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.execute_consent_payment(
        consent_id: "consent_id",
        amount: {
          currency: "GBP",
          value: 1.1
        },
        idempotency_key: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.execute_consent_payment.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_execute_consent_payment_throws_server_error_with_wiremock
    test_id = "payment_initiation.execute_consent_payment.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.execute_consent_payment(
        consent_id: "consent_id",
        amount: {
          currency: "GBP",
          value: 1.1
        },
        idempotency_key: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.execute_consent_payment.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/consent/payment/execute",
      expected: {
        "/amount/value" => 1.1
      }
    )
  end

  def test_payment_initiation_get_payment_with_wiremock
    test_id = "payment_initiation.get_payment.0"

    result = @client.payment_initiation.get_payment(
      payment_id: "payment_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.get_payment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/amount/value" => 100,
        "/schedule/interval_execution_day" => 1,
        "/error/status" => 1
      }
    )
  end

  def test_payment_initiation_get_payment_throws_bad_request_error_with_wiremock
    test_id = "payment_initiation.get_payment.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.get_payment(
        payment_id: "payment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_payment.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_payment_throws_unauthorized_error_with_wiremock
    test_id = "payment_initiation.get_payment.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_initiation.get_payment(
        payment_id: "payment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_payment.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_payment_throws_too_many_requests_error_with_wiremock
    test_id = "payment_initiation.get_payment.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.get_payment(
        payment_id: "payment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_payment.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_payment_throws_internal_server_error_with_wiremock
    test_id = "payment_initiation.get_payment.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.get_payment(
        payment_id: "payment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_payment.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_payment_throws_client_request_error_with_wiremock
    test_id = "payment_initiation.get_payment.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.get_payment(
        payment_id: "payment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_payment.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_get_payment_throws_server_error_with_wiremock
    test_id = "payment_initiation.get_payment.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.get_payment(
        payment_id: "payment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_initiation.get_payment.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_payments_with_wiremock
    test_id = "payment_initiation.list_payments.0"

    result = @client.payment_initiation.list_payments(request_options: {
      additional_headers: {
        "X-Test-Id" => "payment_initiation.list_payments.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_payments_throws_bad_request_error_with_wiremock
    test_id = "payment_initiation.list_payments.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.list_payments(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.list_payments.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_payments_throws_unauthorized_error_with_wiremock
    test_id = "payment_initiation.list_payments.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_initiation.list_payments(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.list_payments.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_payments_throws_too_many_requests_error_with_wiremock
    test_id = "payment_initiation.list_payments.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.list_payments(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.list_payments.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_payments_throws_internal_server_error_with_wiremock
    test_id = "payment_initiation.list_payments.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.list_payments(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.list_payments.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_payments_throws_client_request_error_with_wiremock
    test_id = "payment_initiation.list_payments.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_initiation.list_payments(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.list_payments.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_initiation_list_payments_throws_server_error_with_wiremock
    test_id = "payment_initiation.list_payments.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_initiation.list_payments(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_initiation.list_payments.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_initiation/payment/list",
      query_params: nil,
      expected: 1
    )
  end
end
