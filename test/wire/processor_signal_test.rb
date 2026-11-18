# frozen_string_literal: true

require_relative "wiremock_test_case"

class ProcessorSignalWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_processor_signal_evaluate_with_wiremock
    test_id = "processor.signal.evaluate.0"

    result = @client.processor.signal.evaluate(
      processor_token: "processor_token",
      client_transaction_id: "client_transaction_id",
      amount: 1.1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.signal.evaluate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      expected: {
        "/amount" => 1.1
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/scores/customer_initiated_return_risk/score" => 9,
        "/scores/customer_initiated_return_risk/risk_tier" => 1,
        "/scores/bank_initiated_return_risk/score" => 72,
        "/scores/bank_initiated_return_risk/risk_tier" => 1,
        "/core_attributes/unauthorized_transactions_count_7d" => 1,
        "/core_attributes/unauthorized_transactions_count_30d" => 1,
        "/core_attributes/unauthorized_transactions_count_60d" => 1,
        "/core_attributes/unauthorized_transactions_count_90d" => 1,
        "/core_attributes/nsf_overdraft_transactions_count_7d" => 1,
        "/core_attributes/nsf_overdraft_transactions_count_30d" => 1,
        "/core_attributes/nsf_overdraft_transactions_count_60d" => 1,
        "/core_attributes/nsf_overdraft_transactions_count_90d" => 1,
        "/core_attributes/days_since_first_plaid_connection" => 1,
        "/core_attributes/plaid_connections_count_7d" => 1,
        "/core_attributes/plaid_connections_count_30d" => 1,
        "/core_attributes/total_plaid_connections_count" => 1,
        "/core_attributes/total_credit_transactions_amount_10d" => 1.1,
        "/core_attributes/total_debit_transactions_amount_10d" => 1.1,
        "/core_attributes/p50_credit_transactions_amount_28d" => 1.1,
        "/core_attributes/p50_debit_transactions_amount_28d" => 1.1,
        "/core_attributes/p95_credit_transactions_amount_28d" => 1.1,
        "/core_attributes/p95_debit_transactions_amount_28d" => 1.1,
        "/core_attributes/days_with_negative_balance_count_90d" => 1,
        "/core_attributes/p90_eod_balance_30d" => 1.1,
        "/core_attributes/p90_eod_balance_60d" => 1.1,
        "/core_attributes/p90_eod_balance_90d" => 1.1,
        "/core_attributes/p10_eod_balance_30d" => 1.1,
        "/core_attributes/p10_eod_balance_60d" => 1.1,
        "/core_attributes/p10_eod_balance_90d" => 1.1,
        "/core_attributes/available_balance" => 2000,
        "/core_attributes/current_balance" => 2200,
        "/core_attributes/phone_change_count_28d" => 1,
        "/core_attributes/phone_change_count_90d" => 1,
        "/core_attributes/email_change_count_28d" => 1,
        "/core_attributes/email_change_count_90d" => 1,
        "/core_attributes/address_change_count_28d" => 1,
        "/core_attributes/address_change_count_90d" => 1,
        "/core_attributes/plaid_non_oauth_authentication_attempts_count_3d" => 1,
        "/core_attributes/plaid_non_oauth_authentication_attempts_count_7d" => 1,
        "/core_attributes/plaid_non_oauth_authentication_attempts_count_30d" => 1,
        "/core_attributes/failed_plaid_non_oauth_authentication_attempts_count_3d" => 1,
        "/core_attributes/failed_plaid_non_oauth_authentication_attempts_count_7d" => 1,
        "/core_attributes/failed_plaid_non_oauth_authentication_attempts_count_30d" => 1,
        "/core_attributes/debit_transactions_count_10d" => 1,
        "/core_attributes/credit_transactions_count_10d" => 1,
        "/core_attributes/debit_transactions_count_30d" => 1,
        "/core_attributes/credit_transactions_count_30d" => 1,
        "/core_attributes/debit_transactions_count_60d" => 1,
        "/core_attributes/credit_transactions_count_60d" => 1,
        "/core_attributes/debit_transactions_count_90d" => 1,
        "/core_attributes/credit_transactions_count_90d" => 1,
        "/core_attributes/total_debit_transactions_amount_30d" => 1.1,
        "/core_attributes/total_credit_transactions_amount_30d" => 1.1,
        "/core_attributes/total_debit_transactions_amount_60d" => 1.1,
        "/core_attributes/total_credit_transactions_amount_60d" => 1.1,
        "/core_attributes/total_debit_transactions_amount_90d" => 1.1,
        "/core_attributes/total_credit_transactions_amount_90d" => 1.1,
        "/core_attributes/p50_eod_balance_30d" => 1.1,
        "/core_attributes/p50_eod_balance_60d" => 1.1,
        "/core_attributes/p50_eod_balance_90d" => 1.1,
        "/core_attributes/p50_eod_balance_31d_to_60d" => 1.1,
        "/core_attributes/p50_eod_balance_61d_to_90d" => 1.1,
        "/core_attributes/p90_eod_balance_31d_to_60d" => 1.1,
        "/core_attributes/p90_eod_balance_61d_to_90d" => 1.1,
        "/core_attributes/p10_eod_balance_31d_to_60d" => 1.1,
        "/core_attributes/p10_eod_balance_61d_to_90d" => 1.1,
        "/core_attributes/distinct_ip_addresses_count_3d" => 1,
        "/core_attributes/distinct_ip_addresses_count_7d" => 1,
        "/core_attributes/distinct_ip_addresses_count_30d" => 1,
        "/core_attributes/distinct_ip_addresses_count_90d" => 1,
        "/core_attributes/distinct_user_agents_count_3d" => 1,
        "/core_attributes/distinct_user_agents_count_7d" => 1,
        "/core_attributes/distinct_user_agents_count_30d" => 1,
        "/core_attributes/distinct_user_agents_count_90d" => 1,
        "/core_attributes/distinct_ssl_tls_connection_sessions_count_3d" => 1,
        "/core_attributes/distinct_ssl_tls_connection_sessions_count_7d" => 1,
        "/core_attributes/distinct_ssl_tls_connection_sessions_count_30d" => 1,
        "/core_attributes/distinct_ssl_tls_connection_sessions_count_90d" => 1,
        "/core_attributes/days_since_account_opening" => 1,
        "/core_attributes/balance_to_transaction_amount_ratio" => 1.1
      }
    )
  end

  def test_processor_signal_evaluate_throws_bad_request_error_with_wiremock
    test_id = "processor.signal.evaluate.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.signal.evaluate(
        processor_token: "processor_token",
        client_transaction_id: "x",
        amount: 1.1,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.evaluate.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      expected: {
        "/amount" => 1.1
      }
    )
  end

  def test_processor_signal_evaluate_throws_unauthorized_error_with_wiremock
    test_id = "processor.signal.evaluate.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.signal.evaluate(
        processor_token: "processor_token",
        client_transaction_id: "x",
        amount: 1.1,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.evaluate.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      expected: {
        "/amount" => 1.1
      }
    )
  end

  def test_processor_signal_evaluate_throws_too_many_requests_error_with_wiremock
    test_id = "processor.signal.evaluate.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.signal.evaluate(
        processor_token: "processor_token",
        client_transaction_id: "x",
        amount: 1.1,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.evaluate.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      expected: {
        "/amount" => 1.1
      }
    )
  end

  def test_processor_signal_evaluate_throws_internal_server_error_with_wiremock
    test_id = "processor.signal.evaluate.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.signal.evaluate(
        processor_token: "processor_token",
        client_transaction_id: "x",
        amount: 1.1,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.evaluate.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      expected: {
        "/amount" => 1.1
      }
    )
  end

  def test_processor_signal_evaluate_throws_client_request_error_with_wiremock
    test_id = "processor.signal.evaluate.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.signal.evaluate(
        processor_token: "processor_token",
        client_transaction_id: "x",
        amount: 1.1,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.evaluate.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      expected: {
        "/amount" => 1.1
      }
    )
  end

  def test_processor_signal_evaluate_throws_server_error_with_wiremock
    test_id = "processor.signal.evaluate.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.signal.evaluate(
        processor_token: "processor_token",
        client_transaction_id: "x",
        amount: 1.1,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.evaluate.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/evaluate",
      expected: {
        "/amount" => 1.1
      }
    )
  end

  def test_processor_signal_report_decision_with_wiremock
    test_id = "processor.signal.report_decision.0"

    @client.processor.signal.report_decision(
      processor_token: "processor_token",
      client_transaction_id: "client_transaction_id",
      initiated: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.signal.report_decision.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/decision/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_decision_throws_bad_request_error_with_wiremock
    test_id = "processor.signal.report_decision.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.signal.report_decision(
        processor_token: "processor_token",
        client_transaction_id: "x",
        initiated: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.report_decision.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/decision/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_decision_throws_unauthorized_error_with_wiremock
    test_id = "processor.signal.report_decision.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.signal.report_decision(
        processor_token: "processor_token",
        client_transaction_id: "x",
        initiated: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.report_decision.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/decision/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_decision_throws_too_many_requests_error_with_wiremock
    test_id = "processor.signal.report_decision.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.signal.report_decision(
        processor_token: "processor_token",
        client_transaction_id: "x",
        initiated: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.report_decision.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/decision/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_decision_throws_internal_server_error_with_wiremock
    test_id = "processor.signal.report_decision.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.signal.report_decision(
        processor_token: "processor_token",
        client_transaction_id: "x",
        initiated: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.report_decision.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/decision/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_decision_throws_client_request_error_with_wiremock
    test_id = "processor.signal.report_decision.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.signal.report_decision(
        processor_token: "processor_token",
        client_transaction_id: "x",
        initiated: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.report_decision.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/decision/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_decision_throws_server_error_with_wiremock
    test_id = "processor.signal.report_decision.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.signal.report_decision(
        processor_token: "processor_token",
        client_transaction_id: "x",
        initiated: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.report_decision.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/decision/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_return_with_wiremock
    test_id = "processor.signal.report_return.0"

    @client.processor.signal.report_return(
      processor_token: "processor_token",
      client_transaction_id: "client_transaction_id",
      return_code: "return_code",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.signal.report_return.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/return/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_return_throws_bad_request_error_with_wiremock
    test_id = "processor.signal.report_return.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.signal.report_return(
        processor_token: "processor_token",
        client_transaction_id: "x",
        return_code: "return_code",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.report_return.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/return/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_return_throws_unauthorized_error_with_wiremock
    test_id = "processor.signal.report_return.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.signal.report_return(
        processor_token: "processor_token",
        client_transaction_id: "x",
        return_code: "return_code",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.report_return.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/return/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_return_throws_too_many_requests_error_with_wiremock
    test_id = "processor.signal.report_return.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.signal.report_return(
        processor_token: "processor_token",
        client_transaction_id: "x",
        return_code: "return_code",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.report_return.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/return/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_return_throws_internal_server_error_with_wiremock
    test_id = "processor.signal.report_return.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.signal.report_return(
        processor_token: "processor_token",
        client_transaction_id: "x",
        return_code: "return_code",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.report_return.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/return/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_return_throws_client_request_error_with_wiremock
    test_id = "processor.signal.report_return.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.signal.report_return(
        processor_token: "processor_token",
        client_transaction_id: "x",
        return_code: "return_code",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.report_return.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/return/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_report_return_throws_server_error_with_wiremock
    test_id = "processor.signal.report_return.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.signal.report_return(
        processor_token: "processor_token",
        client_transaction_id: "x",
        return_code: "return_code",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.report_return.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/return/report",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_prepare_with_wiremock
    test_id = "processor.signal.prepare.0"

    @client.processor.signal.prepare(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.signal.prepare.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/prepare",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_prepare_throws_bad_request_error_with_wiremock
    test_id = "processor.signal.prepare.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.signal.prepare(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.prepare.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/prepare",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_prepare_throws_unauthorized_error_with_wiremock
    test_id = "processor.signal.prepare.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.signal.prepare(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.prepare.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/prepare",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_prepare_throws_too_many_requests_error_with_wiremock
    test_id = "processor.signal.prepare.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.signal.prepare(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.prepare.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/prepare",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_prepare_throws_internal_server_error_with_wiremock
    test_id = "processor.signal.prepare.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.signal.prepare(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.prepare.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/prepare",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_prepare_throws_client_request_error_with_wiremock
    test_id = "processor.signal.prepare.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.signal.prepare(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.prepare.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/prepare",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_signal_prepare_throws_server_error_with_wiremock
    test_id = "processor.signal.prepare.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.signal.prepare(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.signal.prepare.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/signal/prepare",
      query_params: nil,
      expected: 1
    )
  end
end
