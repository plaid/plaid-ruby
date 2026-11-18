# frozen_string_literal: true

require_relative "wiremock_test_case"

class BeaconUserWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_beacon_user_create_with_wiremock
    test_id = "beacon_user.create.0"

    result = @client.beacon_user.create(
      program_id: "becprg_11111111111111",
      client_user_id: "your-db-id-3b24110",
      user: {
        name: {
          given_name: "Leslie",
          family_name: "Knope"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_user.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/create",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/version" => 1
      }
    )
  end

  def test_beacon_user_create_throws_bad_request_error_with_wiremock
    test_id = "beacon_user.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.create(
        program_id: "program_id",
        client_user_id: "client_user_id",
        user: {
          name: {
            given_name: "given_name",
            family_name: "family_name"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_create_throws_unauthorized_error_with_wiremock
    test_id = "beacon_user.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.beacon_user.create(
        program_id: "program_id",
        client_user_id: "client_user_id",
        user: {
          name: {
            given_name: "given_name",
            family_name: "family_name"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_create_throws_too_many_requests_error_with_wiremock
    test_id = "beacon_user.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.create(
        program_id: "program_id",
        client_user_id: "client_user_id",
        user: {
          name: {
            given_name: "given_name",
            family_name: "family_name"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_create_throws_internal_server_error_with_wiremock
    test_id = "beacon_user.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_user.create(
        program_id: "program_id",
        client_user_id: "client_user_id",
        user: {
          name: {
            given_name: "given_name",
            family_name: "family_name"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_create_throws_client_request_error_with_wiremock
    test_id = "beacon_user.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.create(
        program_id: "program_id",
        client_user_id: "client_user_id",
        user: {
          name: {
            given_name: "given_name",
            family_name: "family_name"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_create_throws_server_error_with_wiremock
    test_id = "beacon_user.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_user.create(
        program_id: "program_id",
        client_user_id: "client_user_id",
        user: {
          name: {
            given_name: "given_name",
            family_name: "family_name"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_get_with_wiremock
    test_id = "beacon_user.get.0"

    result = @client.beacon_user.get(
      beacon_user_id: "becusr_42cF1MNo42r9Xj",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_user.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/version" => 1
      }
    )
  end

  def test_beacon_user_get_throws_bad_request_error_with_wiremock
    test_id = "beacon_user.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.get(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_get_throws_unauthorized_error_with_wiremock
    test_id = "beacon_user.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.beacon_user.get(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_get_throws_too_many_requests_error_with_wiremock
    test_id = "beacon_user.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.get(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_get_throws_internal_server_error_with_wiremock
    test_id = "beacon_user.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_user.get(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_get_throws_client_request_error_with_wiremock
    test_id = "beacon_user.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.get(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_get_throws_server_error_with_wiremock
    test_id = "beacon_user.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_user.get(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_review_with_wiremock
    test_id = "beacon_user.review.0"

    result = @client.beacon_user.review(
      beacon_user_id: "becusr_42cF1MNo42r9Xj",
      status: "rejected",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_user.review.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/review",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/version" => 1
      }
    )
  end

  def test_beacon_user_review_throws_bad_request_error_with_wiremock
    test_id = "beacon_user.review.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.review(
        beacon_user_id: "beacon_user_id",
        status: "rejected",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.review.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/review",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_review_throws_unauthorized_error_with_wiremock
    test_id = "beacon_user.review.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.beacon_user.review(
        beacon_user_id: "beacon_user_id",
        status: "rejected",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.review.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/review",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_review_throws_too_many_requests_error_with_wiremock
    test_id = "beacon_user.review.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.review(
        beacon_user_id: "beacon_user_id",
        status: "rejected",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.review.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/review",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_review_throws_internal_server_error_with_wiremock
    test_id = "beacon_user.review.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_user.review(
        beacon_user_id: "beacon_user_id",
        status: "rejected",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.review.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/review",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_review_throws_client_request_error_with_wiremock
    test_id = "beacon_user.review.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.review(
        beacon_user_id: "beacon_user_id",
        status: "rejected",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.review.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/review",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_review_throws_server_error_with_wiremock
    test_id = "beacon_user.review.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_user.review(
        beacon_user_id: "beacon_user_id",
        status: "rejected",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.review.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/review",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_update_with_wiremock
    test_id = "beacon_user.update.0"

    result = @client.beacon_user.update(
      beacon_user_id: "becusr_42cF1MNo42r9Xj",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_user.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/update",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/version" => 1
      }
    )
  end

  def test_beacon_user_update_throws_bad_request_error_with_wiremock
    test_id = "beacon_user.update.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.update(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.update.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_update_throws_unauthorized_error_with_wiremock
    test_id = "beacon_user.update.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.beacon_user.update(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.update.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_update_throws_too_many_requests_error_with_wiremock
    test_id = "beacon_user.update.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.update(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.update.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_update_throws_internal_server_error_with_wiremock
    test_id = "beacon_user.update.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_user.update(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.update.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_update_throws_client_request_error_with_wiremock
    test_id = "beacon_user.update.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.update(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.update.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_update_throws_server_error_with_wiremock
    test_id = "beacon_user.update.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_user.update(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.update.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_list_history_with_wiremock
    test_id = "beacon_user.list_history.0"

    result = @client.beacon_user.list_history(
      beacon_user_id: "becusr_42cF1MNo42r9Xj",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_user.list_history.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_list_history_throws_bad_request_error_with_wiremock
    test_id = "beacon_user.list_history.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.list_history(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.list_history.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_list_history_throws_unauthorized_error_with_wiremock
    test_id = "beacon_user.list_history.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.beacon_user.list_history(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.list_history.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_list_history_throws_too_many_requests_error_with_wiremock
    test_id = "beacon_user.list_history.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.list_history(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.list_history.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_list_history_throws_internal_server_error_with_wiremock
    test_id = "beacon_user.list_history.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_user.list_history(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.list_history.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_list_history_throws_client_request_error_with_wiremock
    test_id = "beacon_user.list_history.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.list_history(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.list_history.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_list_history_throws_server_error_with_wiremock
    test_id = "beacon_user.list_history.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_user.list_history(
        beacon_user_id: "beacon_user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.list_history.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_get_account_insights_with_wiremock
    test_id = "beacon_user.get_account_insights.0"

    result = @client.beacon_user.get_account_insights(
      beacon_user_id: "becusr_42cF1MNo42r9Xj",
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_user.get_account_insights.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/account_insights/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/bank_account_insights/accounts/0/attributes/days_since_first_plaid_connection" => 1,
        "/bank_account_insights/accounts/0/attributes/total_plaid_connections_count" => 1,
        "/bank_account_insights/accounts/0/attributes/plaid_connections_count_7d" => 1,
        "/bank_account_insights/accounts/0/attributes/plaid_connections_count_30d" => 1,
        "/bank_account_insights/accounts/0/attributes/failed_plaid_non_oauth_authentication_attempts_count_3d" => 1,
        "/bank_account_insights/accounts/0/attributes/plaid_non_oauth_authentication_attempts_count_3d" => 1,
        "/bank_account_insights/accounts/0/attributes/failed_plaid_non_oauth_authentication_attempts_count_7d" => 1,
        "/bank_account_insights/accounts/0/attributes/plaid_non_oauth_authentication_attempts_count_7d" => 1,
        "/bank_account_insights/accounts/0/attributes/failed_plaid_non_oauth_authentication_attempts_count_30d" => 1,
        "/bank_account_insights/accounts/0/attributes/plaid_non_oauth_authentication_attempts_count_30d" => 1,
        "/bank_account_insights/accounts/0/attributes/distinct_ip_addresses_count_3d" => 1,
        "/bank_account_insights/accounts/0/attributes/distinct_ip_addresses_count_7d" => 1,
        "/bank_account_insights/accounts/0/attributes/distinct_ip_addresses_count_30d" => 1,
        "/bank_account_insights/accounts/0/attributes/distinct_ip_addresses_count_90d" => 1,
        "/bank_account_insights/accounts/0/attributes/distinct_user_agents_count_3d" => 1,
        "/bank_account_insights/accounts/0/attributes/distinct_user_agents_count_7d" => 1,
        "/bank_account_insights/accounts/0/attributes/distinct_user_agents_count_30d" => 1,
        "/bank_account_insights/accounts/0/attributes/distinct_user_agents_count_90d" => 1,
        "/bank_account_insights/accounts/0/attributes/address_change_count_28d" => 1,
        "/bank_account_insights/accounts/0/attributes/email_change_count_28d" => 2,
        "/bank_account_insights/accounts/0/attributes/phone_change_count_28d" => 1,
        "/bank_account_insights/accounts/0/attributes/address_change_count_90d" => 3,
        "/bank_account_insights/accounts/0/attributes/email_change_count_90d" => 4,
        "/bank_account_insights/accounts/0/attributes/phone_change_count_90d" => 2,
        "/bank_account_insights/accounts/0/attributes/days_since_account_opening" => 365,
        "/bank_account_insights/accounts/0/attributes/days_since_first_observed_transaction" => 180
      }
    )
  end

  def test_beacon_user_get_account_insights_throws_bad_request_error_with_wiremock
    test_id = "beacon_user.get_account_insights.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.get_account_insights(
        beacon_user_id: "beacon_user_id",
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.get_account_insights.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/account_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_get_account_insights_throws_unauthorized_error_with_wiremock
    test_id = "beacon_user.get_account_insights.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.beacon_user.get_account_insights(
        beacon_user_id: "beacon_user_id",
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.get_account_insights.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/account_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_get_account_insights_throws_too_many_requests_error_with_wiremock
    test_id = "beacon_user.get_account_insights.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.get_account_insights(
        beacon_user_id: "beacon_user_id",
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.get_account_insights.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/account_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_get_account_insights_throws_internal_server_error_with_wiremock
    test_id = "beacon_user.get_account_insights.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_user.get_account_insights(
        beacon_user_id: "beacon_user_id",
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.get_account_insights.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/account_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_get_account_insights_throws_client_request_error_with_wiremock
    test_id = "beacon_user.get_account_insights.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_user.get_account_insights(
        beacon_user_id: "beacon_user_id",
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.get_account_insights.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/account_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_user_get_account_insights_throws_server_error_with_wiremock
    test_id = "beacon_user.get_account_insights.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_user.get_account_insights(
        beacon_user_id: "beacon_user_id",
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_user.get_account_insights.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/user/account_insights/get",
      query_params: nil,
      expected: 1
    )
  end
end
