# frozen_string_literal: true

require_relative "wiremock_test_case"

class IdentityWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_identity_get_with_wiremock
    test_id = "identity.get.0"

    result = @client.identity.get(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "identity.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/balances/available" => 100,
        "/accounts/0/balances/current" => 110,
        "/accounts/0/apy" => 0,
        "/accounts/1/balances/available" => 200,
        "/accounts/1/balances/current" => 210,
        "/accounts/1/apy" => 0.1
      }
    )
  end

  def test_identity_get_throws_bad_request_error_with_wiremock
    test_id = "identity.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_get_throws_unauthorized_error_with_wiremock
    test_id = "identity.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.identity.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_get_throws_too_many_requests_error_with_wiremock
    test_id = "identity.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_get_throws_internal_server_error_with_wiremock
    test_id = "identity.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_get_throws_client_request_error_with_wiremock
    test_id = "identity.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_get_throws_server_error_with_wiremock
    test_id = "identity.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_get_document_uploads_with_wiremock
    test_id = "identity.get_document_uploads.0"

    result = @client.identity.get_document_uploads(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "identity.get_document_uploads.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/documents/uploads/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/documents/0/metadata/page_count" => 1,
        "/accounts/0/documents/0/risk_insights/risk_summary/risk_score" => 100,
        "/accounts/0/documents/0/risk_insights/risk_signals/0/page_number" => 0,
        "/accounts/0/documents/0/risk_insights/risk_signals/1/page_number" => 0
      }
    )
  end

  def test_identity_get_document_uploads_throws_bad_request_error_with_wiremock
    test_id = "identity.get_document_uploads.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.get_document_uploads(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.get_document_uploads.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/documents/uploads/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_get_document_uploads_throws_unauthorized_error_with_wiremock
    test_id = "identity.get_document_uploads.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.identity.get_document_uploads(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.get_document_uploads.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/documents/uploads/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_get_document_uploads_throws_too_many_requests_error_with_wiremock
    test_id = "identity.get_document_uploads.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.get_document_uploads(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.get_document_uploads.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/documents/uploads/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_get_document_uploads_throws_internal_server_error_with_wiremock
    test_id = "identity.get_document_uploads.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.get_document_uploads(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.get_document_uploads.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/documents/uploads/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_get_document_uploads_throws_client_request_error_with_wiremock
    test_id = "identity.get_document_uploads.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.get_document_uploads(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.get_document_uploads.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/documents/uploads/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_get_document_uploads_throws_server_error_with_wiremock
    test_id = "identity.get_document_uploads.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.get_document_uploads(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.get_document_uploads.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/documents/uploads/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_match_with_wiremock
    test_id = "identity.match.0"

    result = @client.identity.match(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "identity.match.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/accounts/0/apy" => 0,
        "/accounts/0/legal_name/score" => 90,
        "/accounts/0/phone_number/score" => 100,
        "/accounts/0/email_address/score" => 100,
        "/accounts/0/address/score" => 100,
        "/accounts/1/apy" => 0.1,
        "/accounts/1/legal_name/score" => 30,
        "/accounts/1/phone_number/score" => 100,
        "/accounts/1/address/score" => 100
      }
    )
  end

  def test_identity_match_throws_bad_request_error_with_wiremock
    test_id = "identity.match.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.match(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.match.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_match_throws_unauthorized_error_with_wiremock
    test_id = "identity.match.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.identity.match(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.match.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_match_throws_too_many_requests_error_with_wiremock
    test_id = "identity.match.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.match(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.match.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_match_throws_internal_server_error_with_wiremock
    test_id = "identity.match.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.match(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.match.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_match_throws_client_request_error_with_wiremock
    test_id = "identity.match.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.match(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.match.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_match_throws_server_error_with_wiremock
    test_id = "identity.match.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.match(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.match.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_list_matches_with_wiremock
    test_id = "identity.list_matches.0"

    result = @client.identity.list_matches(
      start_time: "2024-01-15T09:30:00Z",
      end_time: "2024-01-15T09:30:00Z",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "identity.list_matches.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_list_matches_throws_bad_request_error_with_wiremock
    test_id = "identity.list_matches.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.list_matches(
        start_time: "2024-01-15T09:30:00Z",
        end_time: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.list_matches.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_list_matches_throws_unauthorized_error_with_wiremock
    test_id = "identity.list_matches.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.identity.list_matches(
        start_time: "2024-01-15T09:30:00Z",
        end_time: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.list_matches.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_list_matches_throws_too_many_requests_error_with_wiremock
    test_id = "identity.list_matches.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.list_matches(
        start_time: "2024-01-15T09:30:00Z",
        end_time: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.list_matches.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_list_matches_throws_internal_server_error_with_wiremock
    test_id = "identity.list_matches.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.list_matches(
        start_time: "2024-01-15T09:30:00Z",
        end_time: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.list_matches.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_list_matches_throws_client_request_error_with_wiremock
    test_id = "identity.list_matches.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.list_matches(
        start_time: "2024-01-15T09:30:00Z",
        end_time: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.list_matches.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_list_matches_throws_server_error_with_wiremock
    test_id = "identity.list_matches.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.list_matches(
        start_time: "2024-01-15T09:30:00Z",
        end_time: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.list_matches.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/match/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_refresh_with_wiremock
    test_id = "identity.refresh.0"

    @client.identity.refresh(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "identity.refresh.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_refresh_throws_bad_request_error_with_wiremock
    test_id = "identity.refresh.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.refresh.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_refresh_throws_unauthorized_error_with_wiremock
    test_id = "identity.refresh.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.identity.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.refresh.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_refresh_throws_too_many_requests_error_with_wiremock
    test_id = "identity.refresh.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.refresh.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_refresh_throws_internal_server_error_with_wiremock
    test_id = "identity.refresh.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.refresh.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_refresh_throws_client_request_error_with_wiremock
    test_id = "identity.refresh.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.refresh.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_refresh_throws_server_error_with_wiremock
    test_id = "identity.refresh.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.refresh(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.refresh.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity/refresh",
      query_params: nil,
      expected: 1
    )
  end
end
