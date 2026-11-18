# frozen_string_literal: true

require_relative "wiremock_test_case"

class StatementsWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_statements_list_with_wiremock
    test_id = "statements.list.0"

    result = @client.statements.list(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "statements.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/list",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/statements/0/month" => 5,
        "/accounts/0/statements/0/year" => 2023
      }
    )
  end

  def test_statements_list_throws_bad_request_error_with_wiremock
    test_id = "statements.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.statements.list(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.list.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_list_throws_unauthorized_error_with_wiremock
    test_id = "statements.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.statements.list(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.list.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_list_throws_too_many_requests_error_with_wiremock
    test_id = "statements.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.statements.list(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.list.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_list_throws_internal_server_error_with_wiremock
    test_id = "statements.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.statements.list(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.list.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_list_throws_client_request_error_with_wiremock
    test_id = "statements.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.statements.list(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.list.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_list_throws_server_error_with_wiremock
    test_id = "statements.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.statements.list(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.list.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_download_with_wiremock
    test_id = "statements.download.0"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.statements.download(
        access_token: "access_token",
        statement_id: "statement_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.download.0"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/download",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_download_throws_unauthorized_error_with_wiremock
    test_id = "statements.download.1"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.statements.download(
        access_token: "access_token",
        statement_id: "statement_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.download.1"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/download",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_download_throws_too_many_requests_error_with_wiremock
    test_id = "statements.download.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.statements.download(
        access_token: "access_token",
        statement_id: "statement_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.download.2"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/download",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_download_throws_internal_server_error_with_wiremock
    test_id = "statements.download.3"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.statements.download(
        access_token: "access_token",
        statement_id: "statement_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.download.3"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/download",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_download_throws_client_request_error_with_wiremock
    test_id = "statements.download.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.statements.download(
        access_token: "access_token",
        statement_id: "statement_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.download.4"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/download",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_download_throws_server_error_with_wiremock
    test_id = "statements.download.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.statements.download(
        access_token: "access_token",
        statement_id: "statement_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.download.5"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/download",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_refresh_with_wiremock
    test_id = "statements.refresh.0"

    @client.statements.refresh(
      access_token: "access_token",
      start_date: "2023-01-15",
      end_date: "2023-01-15",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "statements.refresh.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_refresh_throws_bad_request_error_with_wiremock
    test_id = "statements.refresh.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.statements.refresh(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.refresh.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_refresh_throws_unauthorized_error_with_wiremock
    test_id = "statements.refresh.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.statements.refresh(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.refresh.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_refresh_throws_too_many_requests_error_with_wiremock
    test_id = "statements.refresh.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.statements.refresh(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.refresh.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_refresh_throws_internal_server_error_with_wiremock
    test_id = "statements.refresh.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.statements.refresh(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.refresh.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_refresh_throws_client_request_error_with_wiremock
    test_id = "statements.refresh.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.statements.refresh(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.refresh.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_statements_refresh_throws_server_error_with_wiremock
    test_id = "statements.refresh.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.statements.refresh(
        access_token: "access_token",
        start_date: "2023-01-15",
        end_date: "2023-01-15",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "statements.refresh.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/statements/refresh",
      query_params: nil,
      expected: 1
    )
  end
end
