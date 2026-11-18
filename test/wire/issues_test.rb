# frozen_string_literal: true

require_relative "wiremock_test_case"

class IssuesWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_issues_get_v1_with_wiremock
    test_id = "issues.get_v1.0"

    result = @client.issues.get_v1(
      issue_id: "issue_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.get_v1.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/impact/affected_new_item_count" => 12,
        "/impact/affected_existing_item_count" => 0
      }
    )
  end

  def test_issues_get_v1_throws_bad_request_error_with_wiremock
    test_id = "issues.get_v1.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.get_v1(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.get_v1.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_get_v1_throws_unauthorized_error_with_wiremock
    test_id = "issues.get_v1.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.issues.get_v1(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.get_v1.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_get_v1_throws_too_many_requests_error_with_wiremock
    test_id = "issues.get_v1.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.get_v1(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.get_v1.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_get_v1_throws_internal_server_error_with_wiremock
    test_id = "issues.get_v1.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.get_v1(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.get_v1.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_get_v1_throws_client_request_error_with_wiremock
    test_id = "issues.get_v1.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.get_v1(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.get_v1.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_get_v1_throws_server_error_with_wiremock
    test_id = "issues.get_v1.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.get_v1(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.get_v1.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_list_v1_with_wiremock
    test_id = "issues.list_v1.0"

    result = @client.issues.list_v1(
      institution_id: "institution_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.list_v1.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/list",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/issues/0/impact/affected_new_item_count" => 12,
        "/issues/0/impact/affected_existing_item_count" => 0
      }
    )
  end

  def test_issues_list_v1_throws_bad_request_error_with_wiremock
    test_id = "issues.list_v1.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.list_v1(
        institution_id: "institution_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.list_v1.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_list_v1_throws_unauthorized_error_with_wiremock
    test_id = "issues.list_v1.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.issues.list_v1(
        institution_id: "institution_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.list_v1.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_list_v1_throws_too_many_requests_error_with_wiremock
    test_id = "issues.list_v1.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.list_v1(
        institution_id: "institution_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.list_v1.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_list_v1_throws_internal_server_error_with_wiremock
    test_id = "issues.list_v1.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.list_v1(
        institution_id: "institution_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.list_v1.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_list_v1_throws_client_request_error_with_wiremock
    test_id = "issues.list_v1.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.list_v1(
        institution_id: "institution_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.list_v1.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_list_v1_throws_server_error_with_wiremock
    test_id = "issues.list_v1.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.list_v1(
        institution_id: "institution_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.list_v1.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_match_v1_with_wiremock
    test_id = "issues.match_v1.0"

    result = @client.issues.match_v1(
      identifier_type: "ITEM_ID",
      identifier: "identifier",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.match_v1.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/match",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/issues/0/impact/affected_new_item_count" => 12,
        "/issues/0/impact/affected_existing_item_count" => 0
      }
    )
  end

  def test_issues_match_v1_throws_bad_request_error_with_wiremock
    test_id = "issues.match_v1.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.match_v1(
        identifier_type: "ITEM_ID",
        identifier: "identifier",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.match_v1.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_match_v1_throws_unauthorized_error_with_wiremock
    test_id = "issues.match_v1.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.issues.match_v1(
        identifier_type: "ITEM_ID",
        identifier: "identifier",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.match_v1.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_match_v1_throws_too_many_requests_error_with_wiremock
    test_id = "issues.match_v1.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.match_v1(
        identifier_type: "ITEM_ID",
        identifier: "identifier",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.match_v1.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_match_v1_throws_internal_server_error_with_wiremock
    test_id = "issues.match_v1.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.match_v1(
        identifier_type: "ITEM_ID",
        identifier: "identifier",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.match_v1.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_match_v1_throws_client_request_error_with_wiremock
    test_id = "issues.match_v1.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.match_v1(
        identifier_type: "ITEM_ID",
        identifier: "identifier",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.match_v1.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_match_v1_throws_server_error_with_wiremock
    test_id = "issues.match_v1.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.match_v1(
        identifier_type: "ITEM_ID",
        identifier: "identifier",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.match_v1.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/match",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_v1_with_wiremock
    test_id = "issues.subscribe_v1.0"

    @client.issues.subscribe_v1(
      issue_id: "issue_id",
      webhook: "webhook",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.subscribe_v1.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_v1_throws_bad_request_error_with_wiremock
    test_id = "issues.subscribe_v1.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.subscribe_v1(
        issue_id: "issue_id",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.subscribe_v1.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_v1_throws_unauthorized_error_with_wiremock
    test_id = "issues.subscribe_v1.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.issues.subscribe_v1(
        issue_id: "issue_id",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.subscribe_v1.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_v1_throws_too_many_requests_error_with_wiremock
    test_id = "issues.subscribe_v1.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.subscribe_v1(
        issue_id: "issue_id",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.subscribe_v1.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_v1_throws_internal_server_error_with_wiremock
    test_id = "issues.subscribe_v1.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.subscribe_v1(
        issue_id: "issue_id",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.subscribe_v1.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_v1_throws_client_request_error_with_wiremock
    test_id = "issues.subscribe_v1.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.subscribe_v1(
        issue_id: "issue_id",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.subscribe_v1.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_v1_throws_server_error_with_wiremock
    test_id = "issues.subscribe_v1.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.subscribe_v1(
        issue_id: "issue_id",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.subscribe_v1.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_unsubscribe_v1_with_wiremock
    test_id = "issues.unsubscribe_v1.0"

    @client.issues.unsubscribe_v1(
      issue_id: "issue_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.unsubscribe_v1.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_unsubscribe_v1_throws_bad_request_error_with_wiremock
    test_id = "issues.unsubscribe_v1.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.unsubscribe_v1(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.unsubscribe_v1.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_unsubscribe_v1_throws_unauthorized_error_with_wiremock
    test_id = "issues.unsubscribe_v1.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.issues.unsubscribe_v1(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.unsubscribe_v1.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_unsubscribe_v1_throws_too_many_requests_error_with_wiremock
    test_id = "issues.unsubscribe_v1.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.unsubscribe_v1(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.unsubscribe_v1.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_unsubscribe_v1_throws_internal_server_error_with_wiremock
    test_id = "issues.unsubscribe_v1.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.unsubscribe_v1(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.unsubscribe_v1.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_unsubscribe_v1_throws_client_request_error_with_wiremock
    test_id = "issues.unsubscribe_v1.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.unsubscribe_v1(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.unsubscribe_v1.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_unsubscribe_v1_throws_server_error_with_wiremock
    test_id = "issues.unsubscribe_v1.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.unsubscribe_v1(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.unsubscribe_v1.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/issues/v1/unsubscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_search_with_wiremock
    test_id = "issues.search.0"

    @client.issues.search(request_options: {
      additional_headers: {
        "X-Test-Id" => "issues.search.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_search_throws_bad_request_error_with_wiremock
    test_id = "issues.search.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.search(request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.search.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_search_throws_unauthorized_error_with_wiremock
    test_id = "issues.search.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.issues.search(request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.search.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_search_throws_too_many_requests_error_with_wiremock
    test_id = "issues.search.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.search(request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.search.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_search_throws_internal_server_error_with_wiremock
    test_id = "issues.search.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.search(request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.search.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_search_throws_client_request_error_with_wiremock
    test_id = "issues.search.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.search(request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.search.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_search_throws_server_error_with_wiremock
    test_id = "issues.search.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.search(request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.search.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_get_with_wiremock
    test_id = "issues.get.0"

    @client.issues.get(
      issue_id: "issue_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_get_throws_bad_request_error_with_wiremock
    test_id = "issues.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.get(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_get_throws_unauthorized_error_with_wiremock
    test_id = "issues.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.issues.get(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_get_throws_too_many_requests_error_with_wiremock
    test_id = "issues.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.get(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_get_throws_internal_server_error_with_wiremock
    test_id = "issues.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.get(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_get_throws_client_request_error_with_wiremock
    test_id = "issues.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.get(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_get_throws_server_error_with_wiremock
    test_id = "issues.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.get(
        issue_id: "issue_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_with_wiremock
    test_id = "issues.subscribe.0"

    @client.issues.subscribe(
      issue_id: "issue_id",
      webhook: "webhook",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "issues.subscribe.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_throws_bad_request_error_with_wiremock
    test_id = "issues.subscribe.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.subscribe(
        issue_id: "issue_id",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.subscribe.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_throws_unauthorized_error_with_wiremock
    test_id = "issues.subscribe.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.issues.subscribe(
        issue_id: "issue_id",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.subscribe.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_throws_too_many_requests_error_with_wiremock
    test_id = "issues.subscribe.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.subscribe(
        issue_id: "issue_id",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.subscribe.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_throws_internal_server_error_with_wiremock
    test_id = "issues.subscribe.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.subscribe(
        issue_id: "issue_id",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.subscribe.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_throws_client_request_error_with_wiremock
    test_id = "issues.subscribe.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.issues.subscribe(
        issue_id: "issue_id",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.subscribe.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/subscribe",
      query_params: nil,
      expected: 1
    )
  end

  def test_issues_subscribe_throws_server_error_with_wiremock
    test_id = "issues.subscribe.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.issues.subscribe(
        issue_id: "issue_id",
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "issues.subscribe.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/issues/subscribe",
      query_params: nil,
      expected: 1
    )
  end
end
