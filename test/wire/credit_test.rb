# frozen_string_literal: true

require_relative "wiremock_test_case"

class CreditWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_credit_update_audit_copy_token_with_wiremock
    test_id = "credit.update_audit_copy_token.0"

    @client.credit.update_audit_copy_token(
      audit_copy_token: "audit_copy_token",
      report_tokens: ["report_tokens"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.update_audit_copy_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_audit_copy_token_throws_bad_request_error_with_wiremock
    test_id = "credit.update_audit_copy_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.update_audit_copy_token(
        audit_copy_token: "audit_copy_token",
        report_tokens: %w[report_tokens report_tokens],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_audit_copy_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_audit_copy_token_throws_unauthorized_error_with_wiremock
    test_id = "credit.update_audit_copy_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.update_audit_copy_token(
        audit_copy_token: "audit_copy_token",
        report_tokens: %w[report_tokens report_tokens],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_audit_copy_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_audit_copy_token_throws_too_many_requests_error_with_wiremock
    test_id = "credit.update_audit_copy_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.update_audit_copy_token(
        audit_copy_token: "audit_copy_token",
        report_tokens: %w[report_tokens report_tokens],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_audit_copy_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_audit_copy_token_throws_internal_server_error_with_wiremock
    test_id = "credit.update_audit_copy_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.update_audit_copy_token(
        audit_copy_token: "audit_copy_token",
        report_tokens: %w[report_tokens report_tokens],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_audit_copy_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_audit_copy_token_throws_client_request_error_with_wiremock
    test_id = "credit.update_audit_copy_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.update_audit_copy_token(
        audit_copy_token: "audit_copy_token",
        report_tokens: %w[report_tokens report_tokens],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_audit_copy_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_audit_copy_token_throws_server_error_with_wiremock
    test_id = "credit.update_audit_copy_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.update_audit_copy_token(
        audit_copy_token: "audit_copy_token",
        report_tokens: %w[report_tokens report_tokens],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_audit_copy_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_sessions_with_wiremock
    test_id = "credit.get_sessions.0"

    result = @client.credit.get_sessions(request_options: {
      additional_headers: {
        "X-Test-Id" => "credit.get_sessions.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/sessions/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/sessions/1/results/payroll_income_results/0/num_paystubs_retrieved" => 2,
        "/sessions/1/results/payroll_income_results/0/num_w2s_retrieved" => 1
      }
    )
  end

  def test_credit_get_sessions_throws_bad_request_error_with_wiremock
    test_id = "credit.get_sessions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_sessions(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_sessions.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/sessions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_sessions_throws_unauthorized_error_with_wiremock
    test_id = "credit.get_sessions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.get_sessions(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_sessions.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/sessions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_sessions_throws_too_many_requests_error_with_wiremock
    test_id = "credit.get_sessions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_sessions(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_sessions.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/sessions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_sessions_throws_internal_server_error_with_wiremock
    test_id = "credit.get_sessions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_sessions(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_sessions.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/sessions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_sessions_throws_client_request_error_with_wiremock
    test_id = "credit.get_sessions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_sessions(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_sessions.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/sessions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_sessions_throws_server_error_with_wiremock
    test_id = "credit.get_sessions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_sessions(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_sessions.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/sessions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_audit_copy_token_with_wiremock
    test_id = "credit.create_audit_copy_token.0"

    @client.credit.create_audit_copy_token(
      report_tokens: ["report_tokens"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.create_audit_copy_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_audit_copy_token_throws_bad_request_error_with_wiremock
    test_id = "credit.create_audit_copy_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.create_audit_copy_token(
        report_tokens: %w[report_tokens report_tokens],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.create_audit_copy_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_audit_copy_token_throws_unauthorized_error_with_wiremock
    test_id = "credit.create_audit_copy_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.create_audit_copy_token(
        report_tokens: %w[report_tokens report_tokens],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.create_audit_copy_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_audit_copy_token_throws_too_many_requests_error_with_wiremock
    test_id = "credit.create_audit_copy_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.create_audit_copy_token(
        report_tokens: %w[report_tokens report_tokens],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.create_audit_copy_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_audit_copy_token_throws_internal_server_error_with_wiremock
    test_id = "credit.create_audit_copy_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.create_audit_copy_token(
        report_tokens: %w[report_tokens report_tokens],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.create_audit_copy_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_audit_copy_token_throws_client_request_error_with_wiremock
    test_id = "credit.create_audit_copy_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.create_audit_copy_token(
        report_tokens: %w[report_tokens report_tokens],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.create_audit_copy_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_audit_copy_token_throws_server_error_with_wiremock
    test_id = "credit.create_audit_copy_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.create_audit_copy_token(
        report_tokens: %w[report_tokens report_tokens],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.create_audit_copy_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_audit_copy_token_with_wiremock
    test_id = "credit.remove_audit_copy_token.0"

    @client.credit.remove_audit_copy_token(
      audit_copy_token: "audit_copy_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.remove_audit_copy_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_audit_copy_token_throws_bad_request_error_with_wiremock
    test_id = "credit.remove_audit_copy_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.remove_audit_copy_token(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.remove_audit_copy_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_audit_copy_token_throws_unauthorized_error_with_wiremock
    test_id = "credit.remove_audit_copy_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.remove_audit_copy_token(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.remove_audit_copy_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_audit_copy_token_throws_too_many_requests_error_with_wiremock
    test_id = "credit.remove_audit_copy_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.remove_audit_copy_token(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.remove_audit_copy_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_audit_copy_token_throws_internal_server_error_with_wiremock
    test_id = "credit.remove_audit_copy_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.remove_audit_copy_token(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.remove_audit_copy_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_audit_copy_token_throws_client_request_error_with_wiremock
    test_id = "credit.remove_audit_copy_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.remove_audit_copy_token(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.remove_audit_copy_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_audit_copy_token_throws_server_error_with_wiremock
    test_id = "credit.remove_audit_copy_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.remove_audit_copy_token(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.remove_audit_copy_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/audit_copy_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_asset_report_freddie_mac_with_wiremock
    test_id = "credit.get_asset_report_freddie_mac.0"

    result = @client.credit.get_asset_report_freddie_mac(
      audit_copy_token: "audit_copy_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_asset_report_freddie_mac.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/asset_report/freddie_mac/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/DEAL/SERVICES/SERVICE/VERIFICATION_OF_ASSET/VERIFICATION_OF_ASSET_RESPONSE/ASSETS/ASSET/0/ASSET_DETAIL/AssetAvailableBalanceAmount" => 2073.99,
        "/DEAL/SERVICES/SERVICE/VERIFICATION_OF_ASSET/VERIFICATION_OF_ASSET_RESPONSE/ASSETS/ASSET/0/ASSET_DETAIL/AssetCurrentBalanceAmount" => 2007.09,
        "/DEAL/SERVICES/SERVICE/VERIFICATION_OF_ASSET/VERIFICATION_OF_ASSET_RESPONSE/ASSETS/ASSET/0/ASSET_DETAIL/AssetDaysRequestedCount" => 61,
        "/DEAL/SERVICES/SERVICE/VERIFICATION_OF_ASSET/VERIFICATION_OF_ASSET_RESPONSE/ASSETS/ASSET/0/ASSET_TRANSACTIONS/ASSET_TRANSACTION/0/ASSET_TRANSACTION_DETAIL/AssetTransactionAmount" => 34.43,
        "/SchemaVersion" => 1
      }
    )
  end

  def test_credit_get_asset_report_freddie_mac_throws_bad_request_error_with_wiremock
    test_id = "credit.get_asset_report_freddie_mac.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_asset_report_freddie_mac(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_asset_report_freddie_mac.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/asset_report/freddie_mac/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_asset_report_freddie_mac_throws_unauthorized_error_with_wiremock
    test_id = "credit.get_asset_report_freddie_mac.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.get_asset_report_freddie_mac(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_asset_report_freddie_mac.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/asset_report/freddie_mac/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_asset_report_freddie_mac_throws_too_many_requests_error_with_wiremock
    test_id = "credit.get_asset_report_freddie_mac.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_asset_report_freddie_mac(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_asset_report_freddie_mac.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/asset_report/freddie_mac/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_asset_report_freddie_mac_throws_internal_server_error_with_wiremock
    test_id = "credit.get_asset_report_freddie_mac.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_asset_report_freddie_mac(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_asset_report_freddie_mac.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/asset_report/freddie_mac/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_asset_report_freddie_mac_throws_client_request_error_with_wiremock
    test_id = "credit.get_asset_report_freddie_mac.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_asset_report_freddie_mac(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_asset_report_freddie_mac.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/asset_report/freddie_mac/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_asset_report_freddie_mac_throws_server_error_with_wiremock
    test_id = "credit.get_asset_report_freddie_mac.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_asset_report_freddie_mac(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_asset_report_freddie_mac.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/asset_report/freddie_mac/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_freddie_mac_reports_with_wiremock
    test_id = "credit.get_freddie_mac_reports.0"

    result = @client.credit.get_freddie_mac_reports(
      audit_copy_token: "audit_copy_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_freddie_mac_reports.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/freddie_mac/reports/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/DEAL/SERVICES/SERVICE/VERIFICATION_OF_ASSET/0/VERIFICATION_OF_ASSET_RESPONSE/ASSETS/ASSET/0/ASSET_DETAIL/AssetAvailableBalanceAmount" => 0,
        "/DEAL/SERVICES/SERVICE/VERIFICATION_OF_ASSET/0/VERIFICATION_OF_ASSET_RESPONSE/ASSETS/ASSET/0/ASSET_DETAIL/AssetCurrentBalanceAmount" => 0,
        "/DEAL/SERVICES/SERVICE/VERIFICATION_OF_ASSET/0/VERIFICATION_OF_ASSET_RESPONSE/ASSETS/ASSET/0/ASSET_DETAIL/AssetDaysRequestedCount" => 61,
        "/DEAL/SERVICES/SERVICE/VERIFICATION_OF_ASSET/0/VERIFICATION_OF_ASSET_RESPONSE/ASSETS/ASSET/0/ASSET_TRANSACTIONS/ASSET_TRANSACTION/0/ASSET_TRANSACTION_DETAIL/AssetTransactionAmount" => 0,
        "/DEAL/SERVICES/SERVICE/VERIFICATION_OF_ASSET/1/VERIFICATION_OF_ASSET_RESPONSE/ASSETS/ASSET/0/ASSET_DETAIL/AssetAvailableBalanceAmount" => 2073.99,
        "/DEAL/SERVICES/SERVICE/VERIFICATION_OF_ASSET/1/VERIFICATION_OF_ASSET_RESPONSE/ASSETS/ASSET/0/ASSET_DETAIL/AssetCurrentBalanceAmount" => 2007.09,
        "/DEAL/SERVICES/SERVICE/VERIFICATION_OF_ASSET/1/VERIFICATION_OF_ASSET_RESPONSE/ASSETS/ASSET/0/ASSET_DETAIL/AssetDaysRequestedCount" => 61,
        "/DEAL/SERVICES/SERVICE/VERIFICATION_OF_ASSET/1/VERIFICATION_OF_ASSET_RESPONSE/ASSETS/ASSET/0/ASSET_TRANSACTIONS/ASSET_TRANSACTION/0/ASSET_TRANSACTION_DETAIL/AssetTransactionAmount" => 34.43,
        "/SchemaVersion" => 2.4
      }
    )
  end

  def test_credit_get_freddie_mac_reports_throws_bad_request_error_with_wiremock
    test_id = "credit.get_freddie_mac_reports.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_freddie_mac_reports(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_freddie_mac_reports.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/freddie_mac/reports/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_freddie_mac_reports_throws_unauthorized_error_with_wiremock
    test_id = "credit.get_freddie_mac_reports.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.get_freddie_mac_reports(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_freddie_mac_reports.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/freddie_mac/reports/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_freddie_mac_reports_throws_too_many_requests_error_with_wiremock
    test_id = "credit.get_freddie_mac_reports.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_freddie_mac_reports(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_freddie_mac_reports.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/freddie_mac/reports/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_freddie_mac_reports_throws_internal_server_error_with_wiremock
    test_id = "credit.get_freddie_mac_reports.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_freddie_mac_reports(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_freddie_mac_reports.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/freddie_mac/reports/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_freddie_mac_reports_throws_client_request_error_with_wiremock
    test_id = "credit.get_freddie_mac_reports.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_freddie_mac_reports(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_freddie_mac_reports.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/freddie_mac/reports/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_freddie_mac_reports_throws_server_error_with_wiremock
    test_id = "credit.get_freddie_mac_reports.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_freddie_mac_reports(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_freddie_mac_reports.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/freddie_mac/reports/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_employment_with_wiremock
    test_id = "credit.get_bank_employment.0"

    result = @client.credit.get_bank_employment(
      user_token: "user_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_employment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/credit/v1/bank_employment/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/bank_employment_reports/0/days_requested" => 120
      }
    )
  end

  def test_credit_get_bank_employment_throws_bad_request_error_with_wiremock
    test_id = "credit.get_bank_employment.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_bank_employment(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_bank_employment.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/credit/v1/bank_employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_employment_throws_unauthorized_error_with_wiremock
    test_id = "credit.get_bank_employment.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.get_bank_employment(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_bank_employment.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/credit/v1/bank_employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_employment_throws_too_many_requests_error_with_wiremock
    test_id = "credit.get_bank_employment.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_bank_employment(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_bank_employment.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/credit/v1/bank_employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_employment_throws_internal_server_error_with_wiremock
    test_id = "credit.get_bank_employment.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_bank_employment(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_bank_employment.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/credit/v1/bank_employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_employment_throws_client_request_error_with_wiremock
    test_id = "credit.get_bank_employment.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_bank_employment(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_bank_employment.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/credit/v1/bank_employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_employment_throws_server_error_with_wiremock
    test_id = "credit.get_bank_employment.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_bank_employment(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_bank_employment.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/credit/v1/bank_employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_income_with_wiremock
    test_id = "credit.get_bank_income.0"

    result = @client.credit.get_bank_income(request_options: {
      additional_headers: {
        "X-Test-Id" => "credit.get_bank_income.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/bank_income/0/days_requested" => 15,
        "/bank_income/0/items/0/bank_income_sources/0/total_amount" => 1000.7,
        "/bank_income/0/items/0/bank_income_sources/0/transaction_count" => 1,
        "/bank_income/0/items/0/bank_income_sources/0/historical_summary/0/total_amounts/0/amount" => 1000.7,
        "/bank_income/0/items/0/bank_income_sources/0/historical_summary/0/transactions/0/amount" => 1000.7,
        "/bank_income/0/items/0/bank_income_sources/0/historical_summary/0/total_amount" => 1000.7,
        "/bank_income/0/items/0/bank_income_sources/1/total_amount" => 824.2,
        "/bank_income/0/items/0/bank_income_sources/1/transaction_count" => 1,
        "/bank_income/0/items/0/bank_income_sources/1/historical_summary/0/total_amounts/0/amount" => 824.2,
        "/bank_income/0/items/0/bank_income_sources/1/historical_summary/0/transactions/0/amount" => 824.2,
        "/bank_income/0/items/0/bank_income_sources/1/historical_summary/0/total_amount" => 824.2,
        "/bank_income/0/items/0/bank_income_sources/2/total_amount" => 1525,
        "/bank_income/0/items/0/bank_income_sources/2/transaction_count" => 1,
        "/bank_income/0/items/0/bank_income_sources/2/historical_summary/0/total_amounts/0/amount" => 1525,
        "/bank_income/0/items/0/bank_income_sources/2/historical_summary/0/transactions/0/amount" => 1525,
        "/bank_income/0/items/0/bank_income_sources/2/historical_summary/0/total_amount" => 1525,
        "/bank_income/0/items/0/bank_income_sources/3/total_amount" => 500,
        "/bank_income/0/items/0/bank_income_sources/3/transaction_count" => 1,
        "/bank_income/0/items/0/bank_income_sources/3/historical_summary/0/total_amounts/0/amount" => 500,
        "/bank_income/0/items/0/bank_income_sources/3/historical_summary/0/transactions/0/amount" => 500,
        "/bank_income/0/items/0/bank_income_sources/3/historical_summary/0/total_amount" => 500,
        "/bank_income/0/items/0/bank_income_sources/4/total_amount" => 240.24,
        "/bank_income/0/items/0/bank_income_sources/4/transaction_count" => 2,
        "/bank_income/0/items/0/bank_income_sources/4/historical_summary/0/total_amounts/0/amount" => 240.24,
        "/bank_income/0/items/0/bank_income_sources/4/historical_summary/0/transactions/0/amount" => 120.12,
        "/bank_income/0/items/0/bank_income_sources/4/historical_summary/0/transactions/1/amount" => 120.12,
        "/bank_income/0/items/0/bank_income_sources/4/historical_summary/0/total_amount" => 240.24,
        "/bank_income/0/bank_income_summary/total_amounts/0/amount" => 4090.14,
        "/bank_income/0/bank_income_summary/income_sources_count" => 5,
        "/bank_income/0/bank_income_summary/income_categories_count" => 5,
        "/bank_income/0/bank_income_summary/income_transactions_count" => 6,
        "/bank_income/0/bank_income_summary/historical_summary/0/total_amounts/0/amount" => 4090.14,
        "/bank_income/0/bank_income_summary/historical_summary/0/transactions/0/amount" => 120.12,
        "/bank_income/0/bank_income_summary/historical_summary/0/transactions/1/amount" => 1525,
        "/bank_income/0/bank_income_summary/historical_summary/0/transactions/2/amount" => 500,
        "/bank_income/0/bank_income_summary/historical_summary/0/transactions/3/amount" => 1000.7,
        "/bank_income/0/bank_income_summary/historical_summary/0/transactions/4/amount" => 824.2,
        "/bank_income/0/bank_income_summary/historical_summary/0/transactions/5/amount" => 120.12,
        "/bank_income/0/bank_income_summary/historical_summary/0/total_amount" => 4090.14,
        "/bank_income/0/bank_income_summary/total_amount" => 4090.14
      }
    )
  end

  def test_credit_get_bank_income_throws_bad_request_error_with_wiremock
    test_id = "credit.get_bank_income.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_bank_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_income.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_income_throws_unauthorized_error_with_wiremock
    test_id = "credit.get_bank_income.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.get_bank_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_income.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_income_throws_too_many_requests_error_with_wiremock
    test_id = "credit.get_bank_income.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_bank_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_income.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_income_throws_internal_server_error_with_wiremock
    test_id = "credit.get_bank_income.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_bank_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_income.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_income_throws_client_request_error_with_wiremock
    test_id = "credit.get_bank_income.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_bank_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_income.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_income_throws_server_error_with_wiremock
    test_id = "credit.get_bank_income.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_bank_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_income.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_income_pdf_with_wiremock
    test_id = "credit.get_bank_income_pdf.0"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_bank_income_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_income_pdf.0"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_income_pdf_throws_unauthorized_error_with_wiremock
    test_id = "credit.get_bank_income_pdf.1"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.get_bank_income_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_income_pdf.1"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_income_pdf_throws_too_many_requests_error_with_wiremock
    test_id = "credit.get_bank_income_pdf.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_bank_income_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_income_pdf.2"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_income_pdf_throws_internal_server_error_with_wiremock
    test_id = "credit.get_bank_income_pdf.3"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_bank_income_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_income_pdf.3"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_income_pdf_throws_client_request_error_with_wiremock
    test_id = "credit.get_bank_income_pdf.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_bank_income_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_income_pdf.4"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_income_pdf_throws_server_error_with_wiremock
    test_id = "credit.get_bank_income_pdf.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_bank_income_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_income_pdf.5"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_bank_income_with_wiremock
    test_id = "credit.refresh_bank_income.0"

    @client.credit.refresh_bank_income(
      user_token: "user_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.refresh_bank_income.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_bank_income_throws_bad_request_error_with_wiremock
    test_id = "credit.refresh_bank_income.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.refresh_bank_income(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.refresh_bank_income.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_bank_income_throws_unauthorized_error_with_wiremock
    test_id = "credit.refresh_bank_income.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.refresh_bank_income(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.refresh_bank_income.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_bank_income_throws_too_many_requests_error_with_wiremock
    test_id = "credit.refresh_bank_income.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.refresh_bank_income(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.refresh_bank_income.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_bank_income_throws_internal_server_error_with_wiremock
    test_id = "credit.refresh_bank_income.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.refresh_bank_income(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.refresh_bank_income.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_bank_income_throws_client_request_error_with_wiremock
    test_id = "credit.refresh_bank_income.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.refresh_bank_income(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.refresh_bank_income.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_bank_income_throws_server_error_with_wiremock
    test_id = "credit.refresh_bank_income.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.refresh_bank_income(
        user_token: "user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.refresh_bank_income.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_bank_income_webhook_with_wiremock
    test_id = "credit.update_bank_income_webhook.0"

    @client.credit.update_bank_income_webhook(
      user_token: "user_token",
      enable_webhooks: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.update_bank_income_webhook.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_bank_income_webhook_throws_bad_request_error_with_wiremock
    test_id = "credit.update_bank_income_webhook.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.update_bank_income_webhook(
        user_token: "user_token",
        enable_webhooks: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_bank_income_webhook.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_bank_income_webhook_throws_unauthorized_error_with_wiremock
    test_id = "credit.update_bank_income_webhook.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.update_bank_income_webhook(
        user_token: "user_token",
        enable_webhooks: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_bank_income_webhook.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_bank_income_webhook_throws_too_many_requests_error_with_wiremock
    test_id = "credit.update_bank_income_webhook.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.update_bank_income_webhook(
        user_token: "user_token",
        enable_webhooks: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_bank_income_webhook.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_bank_income_webhook_throws_internal_server_error_with_wiremock
    test_id = "credit.update_bank_income_webhook.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.update_bank_income_webhook(
        user_token: "user_token",
        enable_webhooks: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_bank_income_webhook.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_bank_income_webhook_throws_client_request_error_with_wiremock
    test_id = "credit.update_bank_income_webhook.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.update_bank_income_webhook(
        user_token: "user_token",
        enable_webhooks: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_bank_income_webhook.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_bank_income_webhook_throws_server_error_with_wiremock
    test_id = "credit.update_bank_income_webhook.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.update_bank_income_webhook(
        user_token: "user_token",
        enable_webhooks: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_bank_income_webhook.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_income/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_payroll_income_parsing_config_with_wiremock
    test_id = "credit.update_payroll_income_parsing_config.0"

    @client.credit.update_payroll_income_parsing_config(
      parsing_config: ["ocr"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.update_payroll_income_parsing_config.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/parsing_config/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_payroll_income_parsing_config_throws_bad_request_error_with_wiremock
    test_id = "credit.update_payroll_income_parsing_config.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.update_payroll_income_parsing_config(
        parsing_config: %w[ocr ocr],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_payroll_income_parsing_config.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/parsing_config/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_payroll_income_parsing_config_throws_unauthorized_error_with_wiremock
    test_id = "credit.update_payroll_income_parsing_config.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.update_payroll_income_parsing_config(
        parsing_config: %w[ocr ocr],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_payroll_income_parsing_config.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/parsing_config/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_payroll_income_parsing_config_throws_too_many_requests_error_with_wiremock
    test_id = "credit.update_payroll_income_parsing_config.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.update_payroll_income_parsing_config(
        parsing_config: %w[ocr ocr],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_payroll_income_parsing_config.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/parsing_config/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_payroll_income_parsing_config_throws_internal_server_error_with_wiremock
    test_id = "credit.update_payroll_income_parsing_config.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.update_payroll_income_parsing_config(
        parsing_config: %w[ocr ocr],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_payroll_income_parsing_config.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/parsing_config/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_payroll_income_parsing_config_throws_client_request_error_with_wiremock
    test_id = "credit.update_payroll_income_parsing_config.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.update_payroll_income_parsing_config(
        parsing_config: %w[ocr ocr],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_payroll_income_parsing_config.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/parsing_config/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_update_payroll_income_parsing_config_throws_server_error_with_wiremock
    test_id = "credit.update_payroll_income_parsing_config.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.update_payroll_income_parsing_config(
        parsing_config: %w[ocr ocr],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.update_payroll_income_parsing_config.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/parsing_config/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_statements_uploads_with_wiremock
    test_id = "credit.get_bank_statements_uploads.0"

    result = @client.credit.get_bank_statements_uploads(request_options: {
      additional_headers: {
        "X-Test-Id" => "credit.get_bank_statements_uploads.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_statements/uploads/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/items/0/bank_statements/0/transactions/0/amount" => -1000,
        "/items/0/bank_statements/0/document_metadata/page_count" => 2,
        "/items/0/bank_statements/0/bank_accounts/0/periods/0/starting_balance" => 2500,
        "/items/0/bank_statements/0/bank_accounts/0/periods/0/ending_balance" => 3500
      }
    )
  end

  def test_credit_get_bank_statements_uploads_throws_bad_request_error_with_wiremock
    test_id = "credit.get_bank_statements_uploads.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_bank_statements_uploads(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_statements_uploads.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_statements/uploads/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_statements_uploads_throws_unauthorized_error_with_wiremock
    test_id = "credit.get_bank_statements_uploads.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.get_bank_statements_uploads(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_statements_uploads.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_statements/uploads/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_statements_uploads_throws_too_many_requests_error_with_wiremock
    test_id = "credit.get_bank_statements_uploads.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_bank_statements_uploads(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_statements_uploads.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_statements/uploads/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_statements_uploads_throws_internal_server_error_with_wiremock
    test_id = "credit.get_bank_statements_uploads.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_bank_statements_uploads(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_statements_uploads.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_statements/uploads/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_statements_uploads_throws_client_request_error_with_wiremock
    test_id = "credit.get_bank_statements_uploads.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_bank_statements_uploads(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_statements_uploads.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_statements/uploads/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_bank_statements_uploads_throws_server_error_with_wiremock
    test_id = "credit.get_bank_statements_uploads.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_bank_statements_uploads(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_bank_statements_uploads.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/bank_statements/uploads/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_payroll_income_with_wiremock
    test_id = "credit.get_payroll_income.0"

    result = @client.credit.get_payroll_income(request_options: {
      additional_headers: {
        "X-Test-Id" => "credit.get_payroll_income.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/items/0/accounts/0/rate_of_pay/pay_amount" => 100000,
        "/items/0/payroll_income/0/pay_stubs/0/deductions/breakdown/0/current_amount" => 123.45,
        "/items/0/payroll_income/0/pay_stubs/0/deductions/breakdown/0/ytd_amount" => 246.9,
        "/items/0/payroll_income/0/pay_stubs/0/deductions/total/current_amount" => 123.45,
        "/items/0/payroll_income/0/pay_stubs/0/deductions/total/ytd_amount" => 246.9,
        "/items/0/payroll_income/0/pay_stubs/0/earnings/breakdown/0/current_amount" => 200.22,
        "/items/0/payroll_income/0/pay_stubs/0/earnings/breakdown/0/hours" => 80,
        "/items/0/payroll_income/0/pay_stubs/0/earnings/breakdown/0/ytd_amount" => 400.44,
        "/items/0/payroll_income/0/pay_stubs/0/earnings/breakdown/1/current_amount" => 100,
        "/items/0/payroll_income/0/pay_stubs/0/earnings/breakdown/1/ytd_amount" => 100,
        "/items/0/payroll_income/0/pay_stubs/0/earnings/total/current_amount" => 300.22,
        "/items/0/payroll_income/0/pay_stubs/0/earnings/total/hours" => 160,
        "/items/0/payroll_income/0/pay_stubs/0/earnings/total/ytd_amount" => 500.44,
        "/items/0/payroll_income/0/pay_stubs/0/net_pay/current_amount" => 123.34,
        "/items/0/payroll_income/0/pay_stubs/0/net_pay/ytd_amount" => 253.54,
        "/items/0/payroll_income/0/pay_stubs/0/pay_period_details/pay_amount" => 1490.21,
        "/items/0/payroll_income/0/pay_stubs/0/pay_period_details/distribution_breakdown/0/current_amount" => 176.77,
        "/items/0/payroll_income/0/pay_stubs/0/pay_period_details/gross_earnings" => 4500,
        "/items/0/payroll_income/0/form1099s/0/rents" => 1000,
        "/items/0/payroll_income/0/form1099s/0/royalties" => 1000,
        "/items/0/payroll_income/0/form1099s/0/other_income" => 1000,
        "/items/0/payroll_income/0/form1099s/0/federal_income_tax_withheld" => 1000,
        "/items/0/payroll_income/0/form1099s/0/fishing_boat_proceeds" => 1000,
        "/items/0/payroll_income/0/form1099s/0/medical_and_healthcare_payments" => 1000,
        "/items/0/payroll_income/0/form1099s/0/nonemployee_compensation" => 1000,
        "/items/0/payroll_income/0/form1099s/0/crop_insurance_proceeds" => 1000,
        "/items/0/payroll_income/0/form1099s/0/excess_golden_parachute_payments" => 1000,
        "/items/0/payroll_income/0/form1099s/0/gross_proceeds_paid_to_an_attorney" => 1000,
        "/items/0/payroll_income/0/form1099s/0/section_409a_deferrals" => 1000,
        "/items/0/payroll_income/0/form1099s/0/section_409a_income" => 1000,
        "/items/0/payroll_income/0/form1099s/0/state_tax_withheld" => 1000,
        "/items/0/payroll_income/0/form1099s/0/state_income" => 1000,
        "/items/0/payroll_income/0/form1099s/0/gross_amount" => 1000,
        "/items/0/payroll_income/0/form1099s/0/primary_state_income_tax" => 1000,
        "/items/0/payroll_income/0/i20s/0/personal_funds" => 10000,
        "/items/0/payroll_income/0/i20s/0/on_campus_employment" => 5000,
        "/items/0/payroll_income/0/i20s/0/funds_from_this_school" => 15000,
        "/items/0/payroll_income/0/i20s/0/students_funding_total" => 30000,
        "/items/0/payroll_income/0/i20s/0/funds_from_another_source" => 0,
        "/items/0/payroll_income/0/i20s/0/estimated_average_costs_total" => 28000,
        "/items/0/payroll_income/0/i20s/0/estimated_average_living_expenses" => 12000,
        "/items/0/payroll_income/0/i20s/0/students_funding_period_months" => 9,
        "/items/0/payroll_income/0/i20s/0/estimated_average_costs_period_months" => 9,
        "/error/status" => 1
      }
    )
  end

  def test_credit_get_payroll_income_throws_bad_request_error_with_wiremock
    test_id = "credit.get_payroll_income.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_payroll_income.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_payroll_income_throws_unauthorized_error_with_wiremock
    test_id = "credit.get_payroll_income.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.get_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_payroll_income.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_payroll_income_throws_too_many_requests_error_with_wiremock
    test_id = "credit.get_payroll_income.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_payroll_income.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_payroll_income_throws_internal_server_error_with_wiremock
    test_id = "credit.get_payroll_income.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_payroll_income.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_payroll_income_throws_client_request_error_with_wiremock
    test_id = "credit.get_payroll_income.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_payroll_income.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_payroll_income_throws_server_error_with_wiremock
    test_id = "credit.get_payroll_income.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_payroll_income.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_payroll_income_risk_signals_with_wiremock
    test_id = "credit.get_payroll_income_risk_signals.0"

    result = @client.credit.get_payroll_income_risk_signals(request_options: {
      additional_headers: {
        "X-Test-Id" => "credit.get_payroll_income_risk_signals.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/risk_signals/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/items/0/verification_risk_signals/0/single_document_risk_signals/0/risk_signals/0/page_number" => 1,
        "/items/0/verification_risk_signals/0/single_document_risk_signals/0/risk_signals/1/page_number" => 0,
        "/items/0/verification_risk_signals/0/single_document_risk_signals/0/risk_summary/risk_score" => 70,
        "/error/status" => 1
      }
    )
  end

  def test_credit_get_payroll_income_risk_signals_throws_bad_request_error_with_wiremock
    test_id = "credit.get_payroll_income_risk_signals.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_payroll_income_risk_signals(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_payroll_income_risk_signals.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/risk_signals/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_payroll_income_risk_signals_throws_unauthorized_error_with_wiremock
    test_id = "credit.get_payroll_income_risk_signals.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.get_payroll_income_risk_signals(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_payroll_income_risk_signals.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/risk_signals/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_payroll_income_risk_signals_throws_too_many_requests_error_with_wiremock
    test_id = "credit.get_payroll_income_risk_signals.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_payroll_income_risk_signals(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_payroll_income_risk_signals.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/risk_signals/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_payroll_income_risk_signals_throws_internal_server_error_with_wiremock
    test_id = "credit.get_payroll_income_risk_signals.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_payroll_income_risk_signals(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_payroll_income_risk_signals.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/risk_signals/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_payroll_income_risk_signals_throws_client_request_error_with_wiremock
    test_id = "credit.get_payroll_income_risk_signals.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_payroll_income_risk_signals(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_payroll_income_risk_signals.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/risk_signals/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_payroll_income_risk_signals_throws_server_error_with_wiremock
    test_id = "credit.get_payroll_income_risk_signals.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_payroll_income_risk_signals(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_payroll_income_risk_signals.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/risk_signals/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_precheck_payroll_income_with_wiremock
    test_id = "credit.precheck_payroll_income.0"

    @client.credit.precheck_payroll_income(request_options: {
      additional_headers: {
        "X-Test-Id" => "credit.precheck_payroll_income.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_precheck_payroll_income_throws_bad_request_error_with_wiremock
    test_id = "credit.precheck_payroll_income.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.precheck_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.precheck_payroll_income.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_precheck_payroll_income_throws_unauthorized_error_with_wiremock
    test_id = "credit.precheck_payroll_income.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.precheck_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.precheck_payroll_income.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_precheck_payroll_income_throws_too_many_requests_error_with_wiremock
    test_id = "credit.precheck_payroll_income.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.precheck_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.precheck_payroll_income.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_precheck_payroll_income_throws_internal_server_error_with_wiremock
    test_id = "credit.precheck_payroll_income.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.precheck_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.precheck_payroll_income.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_precheck_payroll_income_throws_client_request_error_with_wiremock
    test_id = "credit.precheck_payroll_income.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.precheck_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.precheck_payroll_income.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_precheck_payroll_income_throws_server_error_with_wiremock
    test_id = "credit.precheck_payroll_income.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.precheck_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.precheck_payroll_income.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_employment_with_wiremock
    test_id = "credit.get_employment.0"

    @client.credit.get_employment(request_options: {
      additional_headers: {
        "X-Test-Id" => "credit.get_employment.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_employment_throws_bad_request_error_with_wiremock
    test_id = "credit.get_employment.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_employment(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_employment.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_employment_throws_unauthorized_error_with_wiremock
    test_id = "credit.get_employment.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.get_employment(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_employment.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_employment_throws_too_many_requests_error_with_wiremock
    test_id = "credit.get_employment.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_employment(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_employment.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_employment_throws_internal_server_error_with_wiremock
    test_id = "credit.get_employment.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_employment(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_employment.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_employment_throws_client_request_error_with_wiremock
    test_id = "credit.get_employment.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_employment(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_employment.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_employment_throws_server_error_with_wiremock
    test_id = "credit.get_employment.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_employment(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_employment.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/employment/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_payroll_income_with_wiremock
    test_id = "credit.refresh_payroll_income.0"

    @client.credit.refresh_payroll_income(request_options: {
      additional_headers: {
        "X-Test-Id" => "credit.refresh_payroll_income.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_payroll_income_throws_bad_request_error_with_wiremock
    test_id = "credit.refresh_payroll_income.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.refresh_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.refresh_payroll_income.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_payroll_income_throws_unauthorized_error_with_wiremock
    test_id = "credit.refresh_payroll_income.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.refresh_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.refresh_payroll_income.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_payroll_income_throws_too_many_requests_error_with_wiremock
    test_id = "credit.refresh_payroll_income.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.refresh_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.refresh_payroll_income.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_payroll_income_throws_internal_server_error_with_wiremock
    test_id = "credit.refresh_payroll_income.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.refresh_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.refresh_payroll_income.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_payroll_income_throws_client_request_error_with_wiremock
    test_id = "credit.refresh_payroll_income.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.refresh_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.refresh_payroll_income.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_payroll_income_throws_server_error_with_wiremock
    test_id = "credit.refresh_payroll_income.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.refresh_payroll_income(request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.refresh_payroll_income.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/payroll_income/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_relay_with_wiremock
    test_id = "credit.create_relay.0"

    @client.credit.create_relay(
      report_tokens: ["report_tokens"],
      secondary_client_id: "secondary_client_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.create_relay.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_relay_throws_bad_request_error_with_wiremock
    test_id = "credit.create_relay.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.create_relay(
        report_tokens: %w[report_tokens report_tokens],
        secondary_client_id: "secondary_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.create_relay.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_relay_throws_unauthorized_error_with_wiremock
    test_id = "credit.create_relay.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.create_relay(
        report_tokens: %w[report_tokens report_tokens],
        secondary_client_id: "secondary_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.create_relay.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_relay_throws_too_many_requests_error_with_wiremock
    test_id = "credit.create_relay.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.create_relay(
        report_tokens: %w[report_tokens report_tokens],
        secondary_client_id: "secondary_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.create_relay.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_relay_throws_internal_server_error_with_wiremock
    test_id = "credit.create_relay.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.create_relay(
        report_tokens: %w[report_tokens report_tokens],
        secondary_client_id: "secondary_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.create_relay.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_relay_throws_client_request_error_with_wiremock
    test_id = "credit.create_relay.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.create_relay(
        report_tokens: %w[report_tokens report_tokens],
        secondary_client_id: "secondary_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.create_relay.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_create_relay_throws_server_error_with_wiremock
    test_id = "credit.create_relay.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.create_relay(
        report_tokens: %w[report_tokens report_tokens],
        secondary_client_id: "secondary_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.create_relay.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_relay_with_wiremock
    test_id = "credit.get_relay.0"

    result = @client.credit.get_relay(
      relay_token: "relay_token",
      report_type: "asset",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.get_relay.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/report/days_requested" => 90,
        "/report/items/0/accounts/0/balances/available" => 43200,
        "/report/items/0/accounts/0/balances/current" => 43200,
        "/report/items/0/accounts/0/days_available" => 90,
        "/report/items/0/accounts/0/transactions/0/amount" => 5850,
        "/report/items/0/accounts/0/historical_balances/0/current" => 49050,
        "/report/items/0/accounts/0/historical_balances/1/current" => 49050,
        "/report/items/0/accounts/0/historical_balances/2/current" => 49050,
        "/report/items/0/accounts/0/historical_balances/3/current" => 49050,
        "/report/items/0/accounts/0/historical_balances/4/current" => 49050,
        "/report/items/0/accounts/1/balances/available" => 100,
        "/report/items/0/accounts/1/balances/current" => 110,
        "/report/items/0/accounts/1/days_available" => 90,
        "/report/items/0/accounts/1/transactions/0/amount" => 89.4,
        "/report/items/0/accounts/1/transactions/1/amount" => 12,
        "/report/items/0/accounts/1/transactions/2/amount" => 4.33,
        "/report/items/0/accounts/1/transactions/3/amount" => -500,
        "/report/items/0/accounts/1/historical_balances/0/current" => 110,
        "/report/items/0/accounts/1/historical_balances/1/current" => -390,
        "/report/items/0/accounts/1/historical_balances/2/current" => -373.67,
        "/report/items/0/accounts/1/historical_balances/3/current" => -284.27,
        "/report/items/0/accounts/1/historical_balances/4/current" => -284.27
      }
    )
  end

  def test_credit_get_relay_throws_bad_request_error_with_wiremock
    test_id = "credit.get_relay.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_relay(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_relay.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_relay_throws_unauthorized_error_with_wiremock
    test_id = "credit.get_relay.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.get_relay(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_relay.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_relay_throws_too_many_requests_error_with_wiremock
    test_id = "credit.get_relay.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_relay(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_relay.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_relay_throws_internal_server_error_with_wiremock
    test_id = "credit.get_relay.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_relay(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_relay.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_relay_throws_client_request_error_with_wiremock
    test_id = "credit.get_relay.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_relay(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_relay.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_relay_throws_server_error_with_wiremock
    test_id = "credit.get_relay.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_relay(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_relay.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_relay_pdf_with_wiremock
    test_id = "credit.get_relay_pdf.0"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_relay_pdf(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_relay_pdf.0"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_relay_pdf_throws_unauthorized_error_with_wiremock
    test_id = "credit.get_relay_pdf.1"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.get_relay_pdf(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_relay_pdf.1"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_relay_pdf_throws_too_many_requests_error_with_wiremock
    test_id = "credit.get_relay_pdf.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_relay_pdf(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_relay_pdf.2"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_relay_pdf_throws_internal_server_error_with_wiremock
    test_id = "credit.get_relay_pdf.3"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_relay_pdf(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_relay_pdf.3"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_relay_pdf_throws_client_request_error_with_wiremock
    test_id = "credit.get_relay_pdf.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.get_relay_pdf(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_relay_pdf.4"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_get_relay_pdf_throws_server_error_with_wiremock
    test_id = "credit.get_relay_pdf.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.get_relay_pdf(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.get_relay_pdf.5"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_relay_with_wiremock
    test_id = "credit.refresh_relay.0"

    @client.credit.refresh_relay(
      relay_token: "relay_token",
      report_type: "asset",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.refresh_relay.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_relay_throws_bad_request_error_with_wiremock
    test_id = "credit.refresh_relay.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.refresh_relay(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.refresh_relay.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_relay_throws_unauthorized_error_with_wiremock
    test_id = "credit.refresh_relay.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.refresh_relay(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.refresh_relay.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_relay_throws_too_many_requests_error_with_wiremock
    test_id = "credit.refresh_relay.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.refresh_relay(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.refresh_relay.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_relay_throws_internal_server_error_with_wiremock
    test_id = "credit.refresh_relay.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.refresh_relay(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.refresh_relay.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_relay_throws_client_request_error_with_wiremock
    test_id = "credit.refresh_relay.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.refresh_relay(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.refresh_relay.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_refresh_relay_throws_server_error_with_wiremock
    test_id = "credit.refresh_relay.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.refresh_relay(
        relay_token: "relay_token",
        report_type: "asset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.refresh_relay.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_relay_with_wiremock
    test_id = "credit.remove_relay.0"

    @client.credit.remove_relay(
      relay_token: "relay_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "credit.remove_relay.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_relay_throws_bad_request_error_with_wiremock
    test_id = "credit.remove_relay.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.remove_relay(
        relay_token: "relay_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.remove_relay.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_relay_throws_unauthorized_error_with_wiremock
    test_id = "credit.remove_relay.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.credit.remove_relay(
        relay_token: "relay_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.remove_relay.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_relay_throws_too_many_requests_error_with_wiremock
    test_id = "credit.remove_relay.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.remove_relay(
        relay_token: "relay_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.remove_relay.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_relay_throws_internal_server_error_with_wiremock
    test_id = "credit.remove_relay.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.remove_relay(
        relay_token: "relay_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.remove_relay.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_relay_throws_client_request_error_with_wiremock
    test_id = "credit.remove_relay.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.credit.remove_relay(
        relay_token: "relay_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.remove_relay.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_credit_remove_relay_throws_server_error_with_wiremock
    test_id = "credit.remove_relay.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.credit.remove_relay(
        relay_token: "relay_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "credit.remove_relay.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/credit/relay/remove",
      query_params: nil,
      expected: 1
    )
  end
end
