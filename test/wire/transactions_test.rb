# frozen_string_literal: true

require_relative "wiremock_test_case"

class TransactionsWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_transactions_get_with_wiremock
    test_id = "transactions.get.0"

    result = @client.transactions.get(
      access_token: "access_token",
      start_date: "2023-01-15",
      end_date: "2023-01-15",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transactions.get.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_throws_bad_request_error_with_wiremock
    test_id = "transactions.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.get(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_throws_unauthorized_error_with_wiremock
    test_id = "transactions.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transactions.get(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_throws_too_many_requests_error_with_wiremock
    test_id = "transactions.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.get(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_throws_internal_server_error_with_wiremock
    test_id = "transactions.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.get(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_throws_client_request_error_with_wiremock
    test_id = "transactions.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.get(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_throws_server_error_with_wiremock
    test_id = "transactions.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.get(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_refresh_with_wiremock
    test_id = "transactions.refresh.0"

    @client.transactions.refresh(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transactions.refresh.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_refresh_throws_bad_request_error_with_wiremock
    test_id = "transactions.refresh.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.refresh.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_refresh_throws_unauthorized_error_with_wiremock
    test_id = "transactions.refresh.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transactions.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.refresh.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_refresh_throws_too_many_requests_error_with_wiremock
    test_id = "transactions.refresh.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.refresh.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_refresh_throws_internal_server_error_with_wiremock
    test_id = "transactions.refresh.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.refresh.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_refresh_throws_client_request_error_with_wiremock
    test_id = "transactions.refresh.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.refresh.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_refresh_throws_server_error_with_wiremock
    test_id = "transactions.refresh.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.refresh.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_recurring_with_wiremock
    test_id = "transactions.get_recurring.0"

    result = @client.transactions.get_recurring(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transactions.get_recurring.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/recurring/get",
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

  def test_transactions_get_recurring_throws_bad_request_error_with_wiremock
    test_id = "transactions.get_recurring.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.get_recurring(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get_recurring.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_recurring_throws_unauthorized_error_with_wiremock
    test_id = "transactions.get_recurring.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transactions.get_recurring(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get_recurring.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_recurring_throws_too_many_requests_error_with_wiremock
    test_id = "transactions.get_recurring.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.get_recurring(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get_recurring.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_recurring_throws_internal_server_error_with_wiremock
    test_id = "transactions.get_recurring.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.get_recurring(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get_recurring.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_recurring_throws_client_request_error_with_wiremock
    test_id = "transactions.get_recurring.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.get_recurring(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get_recurring.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_recurring_throws_server_error_with_wiremock
    test_id = "transactions.get_recurring.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.get_recurring(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get_recurring.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/recurring/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_sync_with_wiremock
    test_id = "transactions.sync.0"

    result = @client.transactions.sync(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transactions.sync.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/sync",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/balances/available" => 110.94,
        "/accounts/0/balances/current" => 110.94,
        "/accounts/0/apy" => 0,
        "/added/0/amount" => 72.1,
        "/added/0/location/lat" => 32.959068,
        "/added/0/location/lon" => -117.037666,
        "/added/0/running_balance" => 110.94,
        "/modified/0/amount" => 28.34,
        "/modified/0/running_balance" => 1.1
      }
    )
  end

  def test_transactions_sync_throws_bad_request_error_with_wiremock
    test_id = "transactions.sync.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.sync(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.sync.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/sync",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_sync_throws_unauthorized_error_with_wiremock
    test_id = "transactions.sync.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transactions.sync(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.sync.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/sync",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_sync_throws_too_many_requests_error_with_wiremock
    test_id = "transactions.sync.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.sync(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.sync.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/sync",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_sync_throws_internal_server_error_with_wiremock
    test_id = "transactions.sync.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.sync(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.sync.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/sync",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_sync_throws_client_request_error_with_wiremock
    test_id = "transactions.sync.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.sync(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.sync.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/sync",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_sync_throws_server_error_with_wiremock
    test_id = "transactions.sync.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.sync(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.sync.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/sync",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_enrich_with_wiremock
    test_id = "transactions.enrich.0"

    result = @client.transactions.enrich(
      account_type: "account_type",
      transactions: [{
        id: "id",
        description: "description",
        amount: 1.1,
        direction: "INFLOW",
        iso_currency_code: "iso_currency_code"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transactions.enrich.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      expected: {
        "/transactions/0/amount" => 1.1
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/enriched_transactions/0/amount" => 72.1,
        "/enriched_transactions/0/enrichments/location/lat" => 32.959068,
        "/enriched_transactions/0/enrichments/location/lon" => -117.037666,
        "/enriched_transactions/1/amount" => 28.34
      }
    )
  end

  def test_transactions_enrich_throws_bad_request_error_with_wiremock
    test_id = "transactions.enrich.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.enrich(
        account_type: "account_type",
        transactions: [{
          id: "id",
          description: "description",
          amount: 1.1,
          direction: "INFLOW",
          iso_currency_code: "iso_currency_code"
        }, {
          id: "id",
          description: "description",
          amount: 1.1,
          direction: "INFLOW",
          iso_currency_code: "iso_currency_code"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.enrich.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      expected: {
        "/transactions/0/amount" => 1.1,
        "/transactions/1/amount" => 1.1
      }
    )
  end

  def test_transactions_enrich_throws_unauthorized_error_with_wiremock
    test_id = "transactions.enrich.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transactions.enrich(
        account_type: "account_type",
        transactions: [{
          id: "id",
          description: "description",
          amount: 1.1,
          direction: "INFLOW",
          iso_currency_code: "iso_currency_code"
        }, {
          id: "id",
          description: "description",
          amount: 1.1,
          direction: "INFLOW",
          iso_currency_code: "iso_currency_code"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.enrich.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      expected: {
        "/transactions/0/amount" => 1.1,
        "/transactions/1/amount" => 1.1
      }
    )
  end

  def test_transactions_enrich_throws_too_many_requests_error_with_wiremock
    test_id = "transactions.enrich.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.enrich(
        account_type: "account_type",
        transactions: [{
          id: "id",
          description: "description",
          amount: 1.1,
          direction: "INFLOW",
          iso_currency_code: "iso_currency_code"
        }, {
          id: "id",
          description: "description",
          amount: 1.1,
          direction: "INFLOW",
          iso_currency_code: "iso_currency_code"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.enrich.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      expected: {
        "/transactions/0/amount" => 1.1,
        "/transactions/1/amount" => 1.1
      }
    )
  end

  def test_transactions_enrich_throws_internal_server_error_with_wiremock
    test_id = "transactions.enrich.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.enrich(
        account_type: "account_type",
        transactions: [{
          id: "id",
          description: "description",
          amount: 1.1,
          direction: "INFLOW",
          iso_currency_code: "iso_currency_code"
        }, {
          id: "id",
          description: "description",
          amount: 1.1,
          direction: "INFLOW",
          iso_currency_code: "iso_currency_code"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.enrich.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      expected: {
        "/transactions/0/amount" => 1.1,
        "/transactions/1/amount" => 1.1
      }
    )
  end

  def test_transactions_enrich_throws_client_request_error_with_wiremock
    test_id = "transactions.enrich.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.enrich(
        account_type: "account_type",
        transactions: [{
          id: "id",
          description: "description",
          amount: 1.1,
          direction: "INFLOW",
          iso_currency_code: "iso_currency_code"
        }, {
          id: "id",
          description: "description",
          amount: 1.1,
          direction: "INFLOW",
          iso_currency_code: "iso_currency_code"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.enrich.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      expected: {
        "/transactions/0/amount" => 1.1,
        "/transactions/1/amount" => 1.1
      }
    )
  end

  def test_transactions_enrich_throws_server_error_with_wiremock
    test_id = "transactions.enrich.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.enrich(
        account_type: "account_type",
        transactions: [{
          id: "id",
          description: "description",
          amount: 1.1,
          direction: "INFLOW",
          iso_currency_code: "iso_currency_code"
        }, {
          id: "id",
          description: "description",
          amount: 1.1,
          direction: "INFLOW",
          iso_currency_code: "iso_currency_code"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.enrich.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transactions/enrich",
      expected: {
        "/transactions/0/amount" => 1.1,
        "/transactions/1/amount" => 1.1
      }
    )
  end

  def test_transactions_create_rule_with_wiremock
    test_id = "transactions.create_rule.0"

    @client.transactions.create_rule(
      client_user_id: "your-client-user-id",
      pfc_primary_category: "FOOD_AND_DRINK",
      pfc_detailed_category: "FOOD_AND_DRINK_FAST_FOOD",
      rule_details: {
        field: "MERCHANT_NAME",
        type: "SUBSTRING_MATCH",
        query: "Burger Shack"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transactions.create_rule.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_create_rule_throws_bad_request_error_with_wiremock
    test_id = "transactions.create_rule.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.create_rule(
        client_user_id: "client_user_id",
        pfc_primary_category: "pfc_primary_category",
        pfc_detailed_category: "pfc_detailed_category",
        rule_details: {
          field: "TRANSACTION_ID",
          type: "EXACT_MATCH",
          query: "query"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.create_rule.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_create_rule_throws_unauthorized_error_with_wiremock
    test_id = "transactions.create_rule.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transactions.create_rule(
        client_user_id: "client_user_id",
        pfc_primary_category: "pfc_primary_category",
        pfc_detailed_category: "pfc_detailed_category",
        rule_details: {
          field: "TRANSACTION_ID",
          type: "EXACT_MATCH",
          query: "query"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.create_rule.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_create_rule_throws_too_many_requests_error_with_wiremock
    test_id = "transactions.create_rule.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.create_rule(
        client_user_id: "client_user_id",
        pfc_primary_category: "pfc_primary_category",
        pfc_detailed_category: "pfc_detailed_category",
        rule_details: {
          field: "TRANSACTION_ID",
          type: "EXACT_MATCH",
          query: "query"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.create_rule.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_create_rule_throws_internal_server_error_with_wiremock
    test_id = "transactions.create_rule.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.create_rule(
        client_user_id: "client_user_id",
        pfc_primary_category: "pfc_primary_category",
        pfc_detailed_category: "pfc_detailed_category",
        rule_details: {
          field: "TRANSACTION_ID",
          type: "EXACT_MATCH",
          query: "query"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.create_rule.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_create_rule_throws_client_request_error_with_wiremock
    test_id = "transactions.create_rule.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.create_rule(
        client_user_id: "client_user_id",
        pfc_primary_category: "pfc_primary_category",
        pfc_detailed_category: "pfc_detailed_category",
        rule_details: {
          field: "TRANSACTION_ID",
          type: "EXACT_MATCH",
          query: "query"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.create_rule.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_create_rule_throws_server_error_with_wiremock
    test_id = "transactions.create_rule.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.create_rule(
        client_user_id: "client_user_id",
        pfc_primary_category: "pfc_primary_category",
        pfc_detailed_category: "pfc_detailed_category",
        rule_details: {
          field: "TRANSACTION_ID",
          type: "EXACT_MATCH",
          query: "query"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.create_rule.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_list_rules_with_wiremock
    test_id = "transactions.list_rules.0"

    @client.transactions.list_rules(
      client_user_id: "your-client-user-id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transactions.list_rules.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_list_rules_throws_bad_request_error_with_wiremock
    test_id = "transactions.list_rules.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.list_rules(
        client_user_id: "client_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.list_rules.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_list_rules_throws_unauthorized_error_with_wiremock
    test_id = "transactions.list_rules.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transactions.list_rules(
        client_user_id: "client_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.list_rules.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_list_rules_throws_too_many_requests_error_with_wiremock
    test_id = "transactions.list_rules.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.list_rules(
        client_user_id: "client_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.list_rules.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_list_rules_throws_internal_server_error_with_wiremock
    test_id = "transactions.list_rules.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.list_rules(
        client_user_id: "client_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.list_rules.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_list_rules_throws_client_request_error_with_wiremock
    test_id = "transactions.list_rules.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.list_rules(
        client_user_id: "client_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.list_rules.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_list_rules_throws_server_error_with_wiremock
    test_id = "transactions.list_rules.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.list_rules(
        client_user_id: "client_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.list_rules.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_remove_rule_with_wiremock
    test_id = "transactions.remove_rule.0"

    @client.transactions.remove_rule(
      client_user_id: "your-client-user-id",
      rule_id: "eVBnVMp7zdTJLkRNr33Rs6zr7KNJqBF",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transactions.remove_rule.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_remove_rule_throws_bad_request_error_with_wiremock
    test_id = "transactions.remove_rule.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.remove_rule(
        client_user_id: "client_user_id",
        rule_id: "rule_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.remove_rule.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_remove_rule_throws_unauthorized_error_with_wiremock
    test_id = "transactions.remove_rule.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transactions.remove_rule(
        client_user_id: "client_user_id",
        rule_id: "rule_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.remove_rule.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_remove_rule_throws_too_many_requests_error_with_wiremock
    test_id = "transactions.remove_rule.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.remove_rule(
        client_user_id: "client_user_id",
        rule_id: "rule_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.remove_rule.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_remove_rule_throws_internal_server_error_with_wiremock
    test_id = "transactions.remove_rule.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.remove_rule(
        client_user_id: "client_user_id",
        rule_id: "rule_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.remove_rule.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_remove_rule_throws_client_request_error_with_wiremock
    test_id = "transactions.remove_rule.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.remove_rule(
        client_user_id: "client_user_id",
        rule_id: "rule_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.remove_rule.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_remove_rule_throws_server_error_with_wiremock
    test_id = "transactions.remove_rule.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.remove_rule(
        client_user_id: "client_user_id",
        rule_id: "rule_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.remove_rule.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/rules/v1/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_user_insights_with_wiremock
    test_id = "transactions.get_user_insights.0"

    result = @client.transactions.get_user_insights(
      client_user_id: "client_user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transactions.get_user_insights.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/user_insights/v1/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/user_data_overview/transaction_count" => 21,
        "/user_data_overview/days_available" => 31,
        "/user_data_overview/total_outflows" => 1245.11,
        "/user_data_overview/total_inflows" => 2300.12,
        "/counterparty_insights/financial_institution_insights/0/detected_accounts/0/transaction_count" => 1,
        "/counterparty_insights/financial_institution_insights/0/detected_accounts/0/newest_transaction_amount" => 500,
        "/counterparty_insights/financial_institution_insights/0/detected_accounts/0/total_outflows" => 503,
        "/counterparty_insights/financial_institution_insights/0/detected_accounts/0/total_inflows" => 0,
        "/counterparty_insights/merchant_insights/0/transaction_count" => 2,
        "/counterparty_insights/merchant_insights/0/total_outflows" => 953.46,
        "/counterparty_insights/merchant_insights/0/total_inflows" => 24.99,
        "/counterparty_insights/merchant_insights/1/transaction_count" => 1,
        "/counterparty_insights/merchant_insights/1/total_outflows" => 123.01,
        "/counterparty_insights/merchant_insights/1/total_inflows" => 0,
        "/category_insights/primary_category_insights/0/transaction_count" => 7,
        "/category_insights/primary_category_insights/0/total_outflows" => 1025.23,
        "/category_insights/primary_category_insights/0/total_inflows" => 24.99,
        "/category_insights/primary_category_insights/1/transaction_count" => 1,
        "/category_insights/primary_category_insights/1/total_outflows" => 123.01,
        "/category_insights/primary_category_insights/1/total_inflows" => 0,
        "/category_insights/detailed_category_insights/0/transaction_count" => 3,
        "/category_insights/detailed_category_insights/0/total_outflows" => 997.11,
        "/category_insights/detailed_category_insights/0/total_inflows" => 24.99,
        "/recurring_transactions/inflow_streams/0/average_days_apart" => 7,
        "/recurring_transactions/inflow_streams/0/transaction_count" => 5,
        "/recurring_transactions/inflow_streams/0/average_amount/amount" => 1000.91,
        "/recurring_transactions/inflow_streams/0/last_amount/amount" => 1000,
        "/recurring_transactions/outflow_streams/0/average_days_apart" => 29,
        "/recurring_transactions/outflow_streams/0/transaction_count" => 4,
        "/recurring_transactions/outflow_streams/0/average_amount/amount" => 85,
        "/recurring_transactions/outflow_streams/0/last_amount/amount" => 100
      }
    )
  end

  def test_transactions_get_user_insights_throws_bad_request_error_with_wiremock
    test_id = "transactions.get_user_insights.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.get_user_insights(
        client_user_id: "client_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get_user_insights.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/user_insights/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_user_insights_throws_unauthorized_error_with_wiremock
    test_id = "transactions.get_user_insights.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transactions.get_user_insights(
        client_user_id: "client_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get_user_insights.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/user_insights/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_user_insights_throws_too_many_requests_error_with_wiremock
    test_id = "transactions.get_user_insights.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.get_user_insights(
        client_user_id: "client_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get_user_insights.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/user_insights/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_user_insights_throws_internal_server_error_with_wiremock
    test_id = "transactions.get_user_insights.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.get_user_insights(
        client_user_id: "client_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get_user_insights.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/user_insights/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_user_insights_throws_client_request_error_with_wiremock
    test_id = "transactions.get_user_insights.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transactions.get_user_insights(
        client_user_id: "client_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get_user_insights.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/user_insights/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transactions_get_user_insights_throws_server_error_with_wiremock
    test_id = "transactions.get_user_insights.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transactions.get_user_insights(
        client_user_id: "client_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transactions.get_user_insights.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/transactions/user_insights/v1/get",
      query_params: nil,
      expected: 1
    )
  end
end
