# frozen_string_literal: true

require_relative "wiremock_test_case"

class ProcessorWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_processor_get_auth_with_wiremock
    test_id = "processor.get_auth.0"

    result = @client.processor.get_auth(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.get_auth.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/auth/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/account/balances/available" => 100,
        "/account/balances/current" => 110,
        "/account/verification_insights/name_match_score" => 1,
        "/account/apy" => 0
      }
    )
  end

  def test_processor_get_auth_throws_bad_request_error_with_wiremock
    test_id = "processor.get_auth.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_auth(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_auth.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_auth_throws_unauthorized_error_with_wiremock
    test_id = "processor.get_auth.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.get_auth(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_auth.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_auth_throws_too_many_requests_error_with_wiremock
    test_id = "processor.get_auth.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_auth(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_auth.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_auth_throws_internal_server_error_with_wiremock
    test_id = "processor.get_auth.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_auth(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_auth.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_auth_throws_client_request_error_with_wiremock
    test_id = "processor.get_auth.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_auth(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_auth.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_auth_throws_server_error_with_wiremock
    test_id = "processor.get_auth.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_auth(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_auth.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_account_with_wiremock
    test_id = "processor.get_account.0"

    result = @client.processor.get_account(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.get_account.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/account/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/account/balances/available" => 100,
        "/account/balances/current" => 110,
        "/account/verification_insights/name_match_score" => 1,
        "/account/apy" => 0
      }
    )
  end

  def test_processor_get_account_throws_bad_request_error_with_wiremock
    test_id = "processor.get_account.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_account(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_account.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/account/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_account_throws_unauthorized_error_with_wiremock
    test_id = "processor.get_account.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.get_account(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_account.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/account/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_account_throws_too_many_requests_error_with_wiremock
    test_id = "processor.get_account.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_account(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_account.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/account/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_account_throws_internal_server_error_with_wiremock
    test_id = "processor.get_account.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_account(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_account.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/account/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_account_throws_client_request_error_with_wiremock
    test_id = "processor.get_account.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_account(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_account.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/account/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_account_throws_server_error_with_wiremock
    test_id = "processor.get_account.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_account(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_account.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/account/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_holdings_with_wiremock
    test_id = "processor.get_investment_holdings.0"

    result = @client.processor.get_investment_holdings(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.get_investment_holdings.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/holdings/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/account/balances/current" => 110.01,
        "/account/verification_insights/name_match_score" => 1,
        "/holdings/0/institution_price" => 1,
        "/holdings/0/institution_value" => 0.01,
        "/holdings/0/cost_basis" => 0.01,
        "/holdings/0/quantity" => 0.01,
        "/holdings/1/institution_price" => 0.011,
        "/holdings/1/institution_value" => 110,
        "/holdings/1/cost_basis" => 100,
        "/holdings/1/quantity" => 10000,
        "/securities/0/close_price" => 0.011,
        "/securities/0/option_contract/strike_price" => 355,
        "/securities/1/close_price" => 1
      }
    )
  end

  def test_processor_get_investment_holdings_throws_bad_request_error_with_wiremock
    test_id = "processor.get_investment_holdings.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_investment_holdings(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_holdings.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/holdings/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_holdings_throws_unauthorized_error_with_wiremock
    test_id = "processor.get_investment_holdings.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.get_investment_holdings(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_holdings.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/holdings/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_holdings_throws_too_many_requests_error_with_wiremock
    test_id = "processor.get_investment_holdings.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_investment_holdings(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_holdings.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/holdings/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_holdings_throws_internal_server_error_with_wiremock
    test_id = "processor.get_investment_holdings.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_investment_holdings(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_holdings.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/holdings/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_holdings_throws_client_request_error_with_wiremock
    test_id = "processor.get_investment_holdings.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_investment_holdings(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_holdings.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/holdings/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_holdings_throws_server_error_with_wiremock
    test_id = "processor.get_investment_holdings.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_investment_holdings(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_holdings.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/holdings/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_auth_with_wiremock
    test_id = "processor.get_investment_auth.0"

    result = @client.processor.get_investment_auth(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.get_investment_auth.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/auth/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/account/balances/current" => 415.57,
        "/account/verification_insights/name_match_score" => 1,
        "/holdings/0/institution_price" => 0.011,
        "/holdings/0/institution_value" => 110,
        "/holdings/0/cost_basis" => 100,
        "/holdings/0/quantity" => 10000,
        "/holdings/1/institution_price" => 42.15,
        "/holdings/1/institution_value" => 210.75,
        "/holdings/1/cost_basis" => 200,
        "/holdings/1/quantity" => 5,
        "/securities/0/close_price" => 0.011,
        "/securities/1/close_price" => 42.15,
        "/account_details_401k/0/fee_details/account_fee_count_12m" => 1,
        "/account_details_401k/0/fee_details/account_fee_amount_12m" => 1.1,
        "/account_details_401k/0/contribution_details/contribution_count_1m" => 1,
        "/account_details_401k/0/contribution_details/contribution_amount_1m" => 1.1,
        "/account_details_401k/0/contribution_details/contribution_count_6m" => 1,
        "/account_details_401k/0/contribution_details/contribution_amount_6m" => 1.1,
        "/account_details_401k/0/contribution_details/contribution_count_12m" => 1,
        "/account_details_401k/0/contribution_details/contribution_amount_12m" => 1.1
      }
    )
  end

  def test_processor_get_investment_auth_throws_bad_request_error_with_wiremock
    test_id = "processor.get_investment_auth.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_investment_auth(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_auth.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_auth_throws_unauthorized_error_with_wiremock
    test_id = "processor.get_investment_auth.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.get_investment_auth(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_auth.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_auth_throws_too_many_requests_error_with_wiremock
    test_id = "processor.get_investment_auth.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_investment_auth(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_auth.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_auth_throws_internal_server_error_with_wiremock
    test_id = "processor.get_investment_auth.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_investment_auth(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_auth.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_auth_throws_client_request_error_with_wiremock
    test_id = "processor.get_investment_auth.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_investment_auth(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_auth.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_auth_throws_server_error_with_wiremock
    test_id = "processor.get_investment_auth.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_investment_auth(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_auth.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/auth/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_transactions_with_wiremock
    test_id = "processor.get_investment_transactions.0"

    result = @client.processor.get_investment_transactions(
      processor_token: "processor_token",
      start_date: "2023-01-15",
      end_date: "2023-01-15",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.get_investment_transactions.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_transactions_throws_bad_request_error_with_wiremock
    test_id = "processor.get_investment_transactions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_investment_transactions(
        processor_token: "processor_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_transactions.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_transactions_throws_unauthorized_error_with_wiremock
    test_id = "processor.get_investment_transactions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.get_investment_transactions(
        processor_token: "processor_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_transactions.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_transactions_throws_too_many_requests_error_with_wiremock
    test_id = "processor.get_investment_transactions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_investment_transactions(
        processor_token: "processor_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_transactions.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_transactions_throws_internal_server_error_with_wiremock
    test_id = "processor.get_investment_transactions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_investment_transactions(
        processor_token: "processor_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_transactions.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_transactions_throws_client_request_error_with_wiremock
    test_id = "processor.get_investment_transactions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_investment_transactions(
        processor_token: "processor_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_transactions.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_investment_transactions_throws_server_error_with_wiremock
    test_id = "processor.get_investment_transactions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_investment_transactions(
        processor_token: "processor_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_investment_transactions.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/investments/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_transactions_with_wiremock
    test_id = "processor.get_transactions.0"

    result = @client.processor.get_transactions(
      processor_token: "processor_token",
      start_date: "2023-01-15",
      end_date: "2023-01-15",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.get_transactions.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_transactions_throws_bad_request_error_with_wiremock
    test_id = "processor.get_transactions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_transactions(
        processor_token: "processor_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_transactions.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_transactions_throws_unauthorized_error_with_wiremock
    test_id = "processor.get_transactions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.get_transactions(
        processor_token: "processor_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_transactions.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_transactions_throws_too_many_requests_error_with_wiremock
    test_id = "processor.get_transactions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_transactions(
        processor_token: "processor_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_transactions.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_transactions_throws_internal_server_error_with_wiremock
    test_id = "processor.get_transactions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_transactions(
        processor_token: "processor_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_transactions.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_transactions_throws_client_request_error_with_wiremock
    test_id = "processor.get_transactions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_transactions(
        processor_token: "processor_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_transactions.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_transactions_throws_server_error_with_wiremock
    test_id = "processor.get_transactions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_transactions(
        processor_token: "processor_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_transactions.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_sync_transactions_with_wiremock
    test_id = "processor.sync_transactions.0"

    result = @client.processor.sync_transactions(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.sync_transactions.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/sync",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/account/balances/available" => 110.94,
        "/account/balances/current" => 110.94,
        "/account/verification_insights/name_match_score" => 1,
        "/account/apy" => 0,
        "/added/0/amount" => 72.1,
        "/added/0/location/lat" => 32.959068,
        "/added/0/location/lon" => -117.037666,
        "/added/0/running_balance" => 110.94,
        "/modified/0/amount" => 28.34,
        "/modified/0/running_balance" => 1.1
      }
    )
  end

  def test_processor_sync_transactions_throws_bad_request_error_with_wiremock
    test_id = "processor.sync_transactions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.sync_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.sync_transactions.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/sync",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_sync_transactions_throws_unauthorized_error_with_wiremock
    test_id = "processor.sync_transactions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.sync_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.sync_transactions.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/sync",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_sync_transactions_throws_too_many_requests_error_with_wiremock
    test_id = "processor.sync_transactions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.sync_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.sync_transactions.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/sync",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_sync_transactions_throws_internal_server_error_with_wiremock
    test_id = "processor.sync_transactions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.sync_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.sync_transactions.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/sync",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_sync_transactions_throws_client_request_error_with_wiremock
    test_id = "processor.sync_transactions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.sync_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.sync_transactions.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/sync",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_sync_transactions_throws_server_error_with_wiremock
    test_id = "processor.sync_transactions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.sync_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.sync_transactions.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/sync",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_refresh_transactions_with_wiremock
    test_id = "processor.refresh_transactions.0"

    @client.processor.refresh_transactions(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.refresh_transactions.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_refresh_transactions_throws_bad_request_error_with_wiremock
    test_id = "processor.refresh_transactions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.refresh_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.refresh_transactions.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_refresh_transactions_throws_unauthorized_error_with_wiremock
    test_id = "processor.refresh_transactions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.refresh_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.refresh_transactions.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_refresh_transactions_throws_too_many_requests_error_with_wiremock
    test_id = "processor.refresh_transactions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.refresh_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.refresh_transactions.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_refresh_transactions_throws_internal_server_error_with_wiremock
    test_id = "processor.refresh_transactions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.refresh_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.refresh_transactions.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_refresh_transactions_throws_client_request_error_with_wiremock
    test_id = "processor.refresh_transactions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.refresh_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.refresh_transactions.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_refresh_transactions_throws_server_error_with_wiremock
    test_id = "processor.refresh_transactions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.refresh_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.refresh_transactions.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_recurring_transactions_with_wiremock
    test_id = "processor.get_recurring_transactions.0"

    result = @client.processor.get_recurring_transactions(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.get_recurring_transactions.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/inflow_streams/0/average_amount/amount" => -800,
        "/inflow_streams/0/last_amount/amount" => -1000,
        "/outflow_streams/0/average_amount/amount" => 85,
        "/outflow_streams/0/last_amount/amount" => 100,
        "/outflow_streams/1/average_amount/amount" => 120,
        "/outflow_streams/1/last_amount/amount" => 120
      }
    )
  end

  def test_processor_get_recurring_transactions_throws_bad_request_error_with_wiremock
    test_id = "processor.get_recurring_transactions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_recurring_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_recurring_transactions.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_recurring_transactions_throws_unauthorized_error_with_wiremock
    test_id = "processor.get_recurring_transactions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.get_recurring_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_recurring_transactions.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_recurring_transactions_throws_too_many_requests_error_with_wiremock
    test_id = "processor.get_recurring_transactions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_recurring_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_recurring_transactions.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_recurring_transactions_throws_internal_server_error_with_wiremock
    test_id = "processor.get_recurring_transactions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_recurring_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_recurring_transactions.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_recurring_transactions_throws_client_request_error_with_wiremock
    test_id = "processor.get_recurring_transactions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_recurring_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_recurring_transactions.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_recurring_transactions_throws_server_error_with_wiremock
    test_id = "processor.get_recurring_transactions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_recurring_transactions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_recurring_transactions.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_bank_transfer_with_wiremock
    test_id = "processor.create_bank_transfer.0"

    @client.processor.create_bank_transfer(
      idempotency_key: "idempotency_key",
      processor_token: "processor_token",
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
          "X-Test-Id" => "processor.create_bank_transfer.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_bank_transfer_throws_bad_request_error_with_wiremock
    test_id = "processor.create_bank_transfer.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.create_bank_transfer(
        idempotency_key: "idempotency_key",
        processor_token: "processor_token",
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
            "X-Test-Id" => "processor.create_bank_transfer.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_bank_transfer_throws_unauthorized_error_with_wiremock
    test_id = "processor.create_bank_transfer.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.create_bank_transfer(
        idempotency_key: "idempotency_key",
        processor_token: "processor_token",
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
            "X-Test-Id" => "processor.create_bank_transfer.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_bank_transfer_throws_too_many_requests_error_with_wiremock
    test_id = "processor.create_bank_transfer.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.create_bank_transfer(
        idempotency_key: "idempotency_key",
        processor_token: "processor_token",
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
            "X-Test-Id" => "processor.create_bank_transfer.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_bank_transfer_throws_internal_server_error_with_wiremock
    test_id = "processor.create_bank_transfer.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.create_bank_transfer(
        idempotency_key: "idempotency_key",
        processor_token: "processor_token",
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
            "X-Test-Id" => "processor.create_bank_transfer.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_bank_transfer_throws_client_request_error_with_wiremock
    test_id = "processor.create_bank_transfer.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.create_bank_transfer(
        idempotency_key: "idempotency_key",
        processor_token: "processor_token",
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
            "X-Test-Id" => "processor.create_bank_transfer.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_bank_transfer_throws_server_error_with_wiremock
    test_id = "processor.create_bank_transfer.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.create_bank_transfer(
        idempotency_key: "idempotency_key",
        processor_token: "processor_token",
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
            "X-Test-Id" => "processor.create_bank_transfer.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/bank_transfer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_liabilities_with_wiremock
    test_id = "processor.get_liabilities.0"

    result = @client.processor.get_liabilities(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.get_liabilities.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/liabilities/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/account/balances/current" => 410,
        "/account/balances/limit" => 2000,
        "/account/verification_insights/name_match_score" => 1,
        "/liabilities/credit/0/aprs/0/apr_percentage" => 15.24,
        "/liabilities/credit/0/aprs/0/balance_subject_to_apr" => 1562.32,
        "/liabilities/credit/0/aprs/0/interest_charge_amount" => 130.22,
        "/liabilities/credit/0/aprs/1/apr_percentage" => 27.95,
        "/liabilities/credit/0/aprs/1/balance_subject_to_apr" => 56.22,
        "/liabilities/credit/0/aprs/1/interest_charge_amount" => 14.81,
        "/liabilities/credit/0/aprs/2/apr_percentage" => 12.5,
        "/liabilities/credit/0/aprs/2/balance_subject_to_apr" => 157.01,
        "/liabilities/credit/0/aprs/2/interest_charge_amount" => 25.66,
        "/liabilities/credit/0/aprs/3/apr_percentage" => 0,
        "/liabilities/credit/0/aprs/3/balance_subject_to_apr" => 1000,
        "/liabilities/credit/0/aprs/3/interest_charge_amount" => 0,
        "/liabilities/credit/0/last_payment_amount" => 168.25,
        "/liabilities/credit/0/last_statement_balance" => 1708.77,
        "/liabilities/credit/0/minimum_payment_amount" => 20,
        "/liabilities/credit/0/cash_advance_limit" => 500,
        "/liabilities/student/0/interest_rate_percentage" => 1.1,
        "/liabilities/line_of_credit/0/aprs/0/apr_percentage" => 1.1
      }
    )
  end

  def test_processor_get_liabilities_throws_bad_request_error_with_wiremock
    test_id = "processor.get_liabilities.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_liabilities(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_liabilities.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/liabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_liabilities_throws_unauthorized_error_with_wiremock
    test_id = "processor.get_liabilities.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.get_liabilities(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_liabilities.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/liabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_liabilities_throws_too_many_requests_error_with_wiremock
    test_id = "processor.get_liabilities.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_liabilities(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_liabilities.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/liabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_liabilities_throws_internal_server_error_with_wiremock
    test_id = "processor.get_liabilities.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_liabilities(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_liabilities.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/liabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_liabilities_throws_client_request_error_with_wiremock
    test_id = "processor.get_liabilities.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_liabilities(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_liabilities.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/liabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_liabilities_throws_server_error_with_wiremock
    test_id = "processor.get_liabilities.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_liabilities(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_liabilities.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/liabilities/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_identity_with_wiremock
    test_id = "processor.get_identity.0"

    result = @client.processor.get_identity(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.get_identity.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/account/balances/available" => 100,
        "/account/balances/current" => 110,
        "/account/verification_insights/name_match_score" => 1,
        "/account/apy" => 0
      }
    )
  end

  def test_processor_get_identity_throws_bad_request_error_with_wiremock
    test_id = "processor.get_identity.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_identity(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_identity.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_identity_throws_unauthorized_error_with_wiremock
    test_id = "processor.get_identity.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.get_identity(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_identity.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_identity_throws_too_many_requests_error_with_wiremock
    test_id = "processor.get_identity.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_identity(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_identity.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_identity_throws_internal_server_error_with_wiremock
    test_id = "processor.get_identity.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_identity(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_identity.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_identity_throws_client_request_error_with_wiremock
    test_id = "processor.get_identity.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_identity(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_identity.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_identity_throws_server_error_with_wiremock
    test_id = "processor.get_identity.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_identity(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_identity.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_match_identity_with_wiremock
    test_id = "processor.match_identity.0"

    result = @client.processor.match_identity(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.match_identity.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/match",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/account/verification_insights/name_match_score" => 1,
        "/account/apy" => 0,
        "/account/legal_name/score" => 90,
        "/account/phone_number/score" => 100,
        "/account/email_address/score" => 100,
        "/account/address/score" => 100
      }
    )
  end

  def test_processor_match_identity_throws_bad_request_error_with_wiremock
    test_id = "processor.match_identity.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.match_identity(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.match_identity.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_match_identity_throws_unauthorized_error_with_wiremock
    test_id = "processor.match_identity.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.match_identity(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.match_identity.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_match_identity_throws_too_many_requests_error_with_wiremock
    test_id = "processor.match_identity.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.match_identity(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.match_identity.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_match_identity_throws_internal_server_error_with_wiremock
    test_id = "processor.match_identity.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.match_identity(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.match_identity.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_match_identity_throws_client_request_error_with_wiremock
    test_id = "processor.match_identity.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.match_identity(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.match_identity.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_match_identity_throws_server_error_with_wiremock
    test_id = "processor.match_identity.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.match_identity(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.match_identity.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/identity/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_balance_with_wiremock
    test_id = "processor.get_balance.0"

    result = @client.processor.get_balance(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.get_balance.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/balance/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/account/balances/available" => 100,
        "/account/balances/current" => 110,
        "/account/verification_insights/name_match_score" => 1,
        "/account/apy" => 0
      }
    )
  end

  def test_processor_get_balance_throws_bad_request_error_with_wiremock
    test_id = "processor.get_balance.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_balance(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_balance.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/balance/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_balance_throws_unauthorized_error_with_wiremock
    test_id = "processor.get_balance.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.get_balance(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_balance.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/balance/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_balance_throws_too_many_requests_error_with_wiremock
    test_id = "processor.get_balance.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_balance(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_balance.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/balance/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_balance_throws_internal_server_error_with_wiremock
    test_id = "processor.get_balance.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_balance(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_balance.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/balance/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_balance_throws_client_request_error_with_wiremock
    test_id = "processor.get_balance.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_balance(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_balance.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/balance/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_balance_throws_server_error_with_wiremock
    test_id = "processor.get_balance.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_balance(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_balance.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/balance/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_token_with_wiremock
    test_id = "processor.create_token.0"

    @client.processor.create_token(
      access_token: "access_token",
      account_id: "account_id",
      processor: "dwolla",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.create_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_token_throws_bad_request_error_with_wiremock
    test_id = "processor.create_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.create_token(
        access_token: "access_token",
        account_id: "account_id",
        processor: "dwolla",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_token_throws_unauthorized_error_with_wiremock
    test_id = "processor.create_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.create_token(
        access_token: "access_token",
        account_id: "account_id",
        processor: "dwolla",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_token_throws_too_many_requests_error_with_wiremock
    test_id = "processor.create_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.create_token(
        access_token: "access_token",
        account_id: "account_id",
        processor: "dwolla",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_token_throws_internal_server_error_with_wiremock
    test_id = "processor.create_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.create_token(
        access_token: "access_token",
        account_id: "account_id",
        processor: "dwolla",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_token_throws_client_request_error_with_wiremock
    test_id = "processor.create_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.create_token(
        access_token: "access_token",
        account_id: "account_id",
        processor: "dwolla",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_token_throws_server_error_with_wiremock
    test_id = "processor.create_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.create_token(
        access_token: "access_token",
        account_id: "account_id",
        processor: "dwolla",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_set_token_permissions_with_wiremock
    test_id = "processor.set_token_permissions.0"

    @client.processor.set_token_permissions(
      processor_token: "processor_token",
      products: ["assets"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.set_token_permissions.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/set",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_set_token_permissions_throws_bad_request_error_with_wiremock
    test_id = "processor.set_token_permissions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.set_token_permissions(
        processor_token: "processor_token",
        products: %w[assets assets],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.set_token_permissions.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/set",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_set_token_permissions_throws_unauthorized_error_with_wiremock
    test_id = "processor.set_token_permissions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.set_token_permissions(
        processor_token: "processor_token",
        products: %w[assets assets],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.set_token_permissions.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/set",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_set_token_permissions_throws_too_many_requests_error_with_wiremock
    test_id = "processor.set_token_permissions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.set_token_permissions(
        processor_token: "processor_token",
        products: %w[assets assets],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.set_token_permissions.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/set",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_set_token_permissions_throws_internal_server_error_with_wiremock
    test_id = "processor.set_token_permissions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.set_token_permissions(
        processor_token: "processor_token",
        products: %w[assets assets],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.set_token_permissions.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/set",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_set_token_permissions_throws_client_request_error_with_wiremock
    test_id = "processor.set_token_permissions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.set_token_permissions(
        processor_token: "processor_token",
        products: %w[assets assets],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.set_token_permissions.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/set",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_set_token_permissions_throws_server_error_with_wiremock
    test_id = "processor.set_token_permissions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.set_token_permissions(
        processor_token: "processor_token",
        products: %w[assets assets],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.set_token_permissions.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/set",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_token_permissions_with_wiremock
    test_id = "processor.get_token_permissions.0"

    @client.processor.get_token_permissions(
      processor_token: "processor_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.get_token_permissions.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_token_permissions_throws_bad_request_error_with_wiremock
    test_id = "processor.get_token_permissions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_token_permissions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_token_permissions.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_token_permissions_throws_unauthorized_error_with_wiremock
    test_id = "processor.get_token_permissions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.get_token_permissions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_token_permissions.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_token_permissions_throws_too_many_requests_error_with_wiremock
    test_id = "processor.get_token_permissions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_token_permissions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_token_permissions.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_token_permissions_throws_internal_server_error_with_wiremock
    test_id = "processor.get_token_permissions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_token_permissions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_token_permissions.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_token_permissions_throws_client_request_error_with_wiremock
    test_id = "processor.get_token_permissions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.get_token_permissions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_token_permissions.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_get_token_permissions_throws_server_error_with_wiremock
    test_id = "processor.get_token_permissions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.get_token_permissions(
        processor_token: "processor_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.get_token_permissions.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/permissions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_update_token_webhook_with_wiremock
    test_id = "processor.update_token_webhook.0"

    @client.processor.update_token_webhook(
      processor_token: "processor_token",
      webhook: nil,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.update_token_webhook.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_update_token_webhook_throws_bad_request_error_with_wiremock
    test_id = "processor.update_token_webhook.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.update_token_webhook(
        processor_token: "processor_token",
        webhook: nil,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.update_token_webhook.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_update_token_webhook_throws_unauthorized_error_with_wiremock
    test_id = "processor.update_token_webhook.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.update_token_webhook(
        processor_token: "processor_token",
        webhook: nil,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.update_token_webhook.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_update_token_webhook_throws_too_many_requests_error_with_wiremock
    test_id = "processor.update_token_webhook.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.update_token_webhook(
        processor_token: "processor_token",
        webhook: nil,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.update_token_webhook.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_update_token_webhook_throws_internal_server_error_with_wiremock
    test_id = "processor.update_token_webhook.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.update_token_webhook(
        processor_token: "processor_token",
        webhook: nil,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.update_token_webhook.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_update_token_webhook_throws_client_request_error_with_wiremock
    test_id = "processor.update_token_webhook.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.update_token_webhook(
        processor_token: "processor_token",
        webhook: nil,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.update_token_webhook.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_update_token_webhook_throws_server_error_with_wiremock
    test_id = "processor.update_token_webhook.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.update_token_webhook(
        processor_token: "processor_token",
        webhook: nil,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.update_token_webhook.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/token/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_stripe_bank_account_token_with_wiremock
    test_id = "processor.create_stripe_bank_account_token.0"

    @client.processor.create_stripe_bank_account_token(
      access_token: "access_token",
      account_id: "account_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.create_stripe_bank_account_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/stripe/bank_account_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_stripe_bank_account_token_throws_bad_request_error_with_wiremock
    test_id = "processor.create_stripe_bank_account_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.create_stripe_bank_account_token(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_stripe_bank_account_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/stripe/bank_account_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_stripe_bank_account_token_throws_unauthorized_error_with_wiremock
    test_id = "processor.create_stripe_bank_account_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.create_stripe_bank_account_token(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_stripe_bank_account_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/stripe/bank_account_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_stripe_bank_account_token_throws_too_many_requests_error_with_wiremock
    test_id = "processor.create_stripe_bank_account_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.create_stripe_bank_account_token(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_stripe_bank_account_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/stripe/bank_account_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_stripe_bank_account_token_throws_internal_server_error_with_wiremock
    test_id = "processor.create_stripe_bank_account_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.create_stripe_bank_account_token(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_stripe_bank_account_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/stripe/bank_account_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_stripe_bank_account_token_throws_client_request_error_with_wiremock
    test_id = "processor.create_stripe_bank_account_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.create_stripe_bank_account_token(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_stripe_bank_account_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/stripe/bank_account_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_stripe_bank_account_token_throws_server_error_with_wiremock
    test_id = "processor.create_stripe_bank_account_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.create_stripe_bank_account_token(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_stripe_bank_account_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/stripe/bank_account_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_apex_processor_token_with_wiremock
    test_id = "processor.create_apex_processor_token.0"

    @client.processor.create_apex_processor_token(
      access_token: "access_token",
      account_id: "account_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "processor.create_apex_processor_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/apex/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_apex_processor_token_throws_bad_request_error_with_wiremock
    test_id = "processor.create_apex_processor_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.create_apex_processor_token(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_apex_processor_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/apex/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_apex_processor_token_throws_unauthorized_error_with_wiremock
    test_id = "processor.create_apex_processor_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.processor.create_apex_processor_token(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_apex_processor_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/apex/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_apex_processor_token_throws_too_many_requests_error_with_wiremock
    test_id = "processor.create_apex_processor_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.create_apex_processor_token(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_apex_processor_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/apex/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_apex_processor_token_throws_internal_server_error_with_wiremock
    test_id = "processor.create_apex_processor_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.create_apex_processor_token(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_apex_processor_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/apex/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_apex_processor_token_throws_client_request_error_with_wiremock
    test_id = "processor.create_apex_processor_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.processor.create_apex_processor_token(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_apex_processor_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/apex/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_processor_create_apex_processor_token_throws_server_error_with_wiremock
    test_id = "processor.create_apex_processor_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.processor.create_apex_processor_token(
        access_token: "access_token",
        account_id: "account_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "processor.create_apex_processor_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processor/apex/processor_token/create",
      query_params: nil,
      expected: 1
    )
  end
end
