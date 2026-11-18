# frozen_string_literal: true

require_relative "wiremock_test_case"

class UserWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_user_refresh_transactions_with_wiremock
    test_id = "user.refresh_transactions.0"

    @client.user.refresh_transactions(
      user_id: "usr_8c3ZbDBYjaqUXZ",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.refresh_transactions.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_transactions_throws_bad_request_error_with_wiremock
    test_id = "user.refresh_transactions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.refresh_transactions(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.refresh_transactions.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_transactions_throws_unauthorized_error_with_wiremock
    test_id = "user.refresh_transactions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.refresh_transactions(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.refresh_transactions.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_transactions_throws_too_many_requests_error_with_wiremock
    test_id = "user.refresh_transactions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.refresh_transactions(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.refresh_transactions.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_transactions_throws_internal_server_error_with_wiremock
    test_id = "user.refresh_transactions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.refresh_transactions(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.refresh_transactions.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_transactions_throws_client_request_error_with_wiremock
    test_id = "user.refresh_transactions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.refresh_transactions(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.refresh_transactions.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_transactions_throws_server_error_with_wiremock
    test_id = "user.refresh_transactions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.refresh_transactions(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.refresh_transactions.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transactions/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_financial_data_with_wiremock
    test_id = "user.refresh_financial_data.0"

    @client.user.refresh_financial_data(
      user_id: "usr_8c3ZbDBYjaqUXZ",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.refresh_financial_data.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/financial_data/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_financial_data_throws_bad_request_error_with_wiremock
    test_id = "user.refresh_financial_data.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.refresh_financial_data(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.refresh_financial_data.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/financial_data/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_financial_data_throws_unauthorized_error_with_wiremock
    test_id = "user.refresh_financial_data.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.refresh_financial_data(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.refresh_financial_data.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/financial_data/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_financial_data_throws_too_many_requests_error_with_wiremock
    test_id = "user.refresh_financial_data.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.refresh_financial_data(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.refresh_financial_data.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/financial_data/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_financial_data_throws_internal_server_error_with_wiremock
    test_id = "user.refresh_financial_data.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.refresh_financial_data(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.refresh_financial_data.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/financial_data/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_financial_data_throws_client_request_error_with_wiremock
    test_id = "user.refresh_financial_data.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.refresh_financial_data(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.refresh_financial_data.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/financial_data/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_refresh_financial_data_throws_server_error_with_wiremock
    test_id = "user.refresh_financial_data.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.refresh_financial_data(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.refresh_financial_data.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/financial_data/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_with_wiremock
    test_id = "user.create.0"

    @client.user.create(
      client_user_id: "client_user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_example2_with_wiremock
    test_id = "user.create.1"

    @client.user.create(
      client_user_id: "client_user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.create.1"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_throws_bad_request_error_with_wiremock
    test_id = "user.create.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.create(
        client_user_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.create.2"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_throws_unauthorized_error_with_wiremock
    test_id = "user.create.3"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.create(
        client_user_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.create.3"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_throws_too_many_requests_error_with_wiremock
    test_id = "user.create.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.create(
        client_user_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.create.4"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_throws_internal_server_error_with_wiremock
    test_id = "user.create.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.create(
        client_user_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.create.5"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_throws_client_request_error_with_wiremock
    test_id = "user.create.6"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.create(
        client_user_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.create.6"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_throws_server_error_with_wiremock
    test_id = "user.create.7"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.create(
        client_user_id: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.create.7"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_with_wiremock
    test_id = "user.get.0"

    @client.user.get(
      user_id: "user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_throws_bad_request_error_with_wiremock
    test_id = "user.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.get(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_throws_unauthorized_error_with_wiremock
    test_id = "user.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.get(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_throws_too_many_requests_error_with_wiremock
    test_id = "user.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.get(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_throws_internal_server_error_with_wiremock
    test_id = "user.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.get(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_throws_client_request_error_with_wiremock
    test_id = "user.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.get(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_throws_server_error_with_wiremock
    test_id = "user.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.get(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_identity_with_wiremock
    test_id = "user.remove_identity.0"

    @client.user.remove_identity(
      user_id: "user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.remove_identity.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/identity/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_identity_throws_bad_request_error_with_wiremock
    test_id = "user.remove_identity.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.remove_identity(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_identity.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/identity/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_identity_throws_unauthorized_error_with_wiremock
    test_id = "user.remove_identity.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.remove_identity(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_identity.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/identity/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_identity_throws_too_many_requests_error_with_wiremock
    test_id = "user.remove_identity.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.remove_identity(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_identity.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/identity/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_identity_throws_internal_server_error_with_wiremock
    test_id = "user.remove_identity.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.remove_identity(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_identity.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/identity/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_identity_throws_client_request_error_with_wiremock
    test_id = "user.remove_identity.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.remove_identity(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_identity.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/identity/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_identity_throws_server_error_with_wiremock
    test_id = "user.remove_identity.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.remove_identity(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_identity.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/identity/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_update_with_wiremock
    test_id = "user.update.0"

    @client.user.update(request_options: {
      additional_headers: {
        "X-Test-Id" => "user.update.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_update_throws_bad_request_error_with_wiremock
    test_id = "user.update.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.update(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.update.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_update_throws_unauthorized_error_with_wiremock
    test_id = "user.update.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.update(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.update.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_update_throws_too_many_requests_error_with_wiremock
    test_id = "user.update.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.update(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.update.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_update_throws_internal_server_error_with_wiremock
    test_id = "user.update.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.update(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.update.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_update_throws_client_request_error_with_wiremock
    test_id = "user.update.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.update(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.update.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_update_throws_server_error_with_wiremock
    test_id = "user.update.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.update(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.update.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_with_wiremock
    test_id = "user.remove.0"

    @client.user.remove(request_options: {
      additional_headers: {
        "X-Test-Id" => "user.remove.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_throws_bad_request_error_with_wiremock
    test_id = "user.remove.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.remove(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.remove.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_throws_unauthorized_error_with_wiremock
    test_id = "user.remove.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.remove(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.remove.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_throws_too_many_requests_error_with_wiremock
    test_id = "user.remove.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.remove(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.remove.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_throws_internal_server_error_with_wiremock
    test_id = "user.remove.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.remove(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.remove.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_throws_client_request_error_with_wiremock
    test_id = "user.remove.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.remove(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.remove.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_throws_server_error_with_wiremock
    test_id = "user.remove.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.remove(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.remove.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_terminate_products_with_wiremock
    test_id = "user.terminate_products.0"

    @client.user.terminate_products(
      user_id: "usr_8c3ZbDBYjaqUXZ",
      reason_code: "CONSUMER_ACCOUNT_CLOSED",
      reason_note: "User closed account with client.",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.terminate_products.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_terminate_products_example2_with_wiremock
    test_id = "user.terminate_products.1"

    @client.user.terminate_products(
      user_id: "usr_8c3ZbDBYjaqUXZ",
      reason_code: "CONSUMER_LOAN_PAID_OFF",
      reason_note: "Consumer loan has been paid in full.",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.terminate_products.1"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_terminate_products_throws_bad_request_error_with_wiremock
    test_id = "user.terminate_products.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.terminate_products(
        user_id: "user_id",
        reason_code: "FRAUD_FIRST_PARTY",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.terminate_products.2"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_terminate_products_throws_unauthorized_error_with_wiremock
    test_id = "user.terminate_products.3"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.terminate_products(
        user_id: "user_id",
        reason_code: "FRAUD_FIRST_PARTY",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.terminate_products.3"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_terminate_products_throws_too_many_requests_error_with_wiremock
    test_id = "user.terminate_products.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.terminate_products(
        user_id: "user_id",
        reason_code: "FRAUD_FIRST_PARTY",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.terminate_products.4"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_terminate_products_throws_internal_server_error_with_wiremock
    test_id = "user.terminate_products.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.terminate_products(
        user_id: "user_id",
        reason_code: "FRAUD_FIRST_PARTY",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.terminate_products.5"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_terminate_products_throws_client_request_error_with_wiremock
    test_id = "user.terminate_products.6"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.terminate_products(
        user_id: "user_id",
        reason_code: "FRAUD_FIRST_PARTY",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.terminate_products.6"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_terminate_products_throws_server_error_with_wiremock
    test_id = "user.terminate_products.7"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.terminate_products(
        user_id: "user_id",
        reason_code: "FRAUD_FIRST_PARTY",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.terminate_products.7"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_transfer_limits_with_wiremock
    test_id = "user.get_transfer_limits.0"

    @client.user.get_transfer_limits(
      user_id: "user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.get_transfer_limits.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transfer/limits/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_transfer_limits_throws_bad_request_error_with_wiremock
    test_id = "user.get_transfer_limits.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.get_transfer_limits(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.get_transfer_limits.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transfer/limits/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_transfer_limits_throws_unauthorized_error_with_wiremock
    test_id = "user.get_transfer_limits.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.get_transfer_limits(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.get_transfer_limits.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transfer/limits/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_transfer_limits_throws_too_many_requests_error_with_wiremock
    test_id = "user.get_transfer_limits.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.get_transfer_limits(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.get_transfer_limits.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transfer/limits/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_transfer_limits_throws_internal_server_error_with_wiremock
    test_id = "user.get_transfer_limits.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.get_transfer_limits(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.get_transfer_limits.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transfer/limits/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_transfer_limits_throws_client_request_error_with_wiremock
    test_id = "user.get_transfer_limits.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.get_transfer_limits(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.get_transfer_limits.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transfer/limits/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_transfer_limits_throws_server_error_with_wiremock
    test_id = "user.get_transfer_limits.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.get_transfer_limits(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.get_transfer_limits.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/transfer/limits/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_items_with_wiremock
    test_id = "user.get_items.0"

    @client.user.get_items(request_options: {
      additional_headers: {
        "X-Test-Id" => "user.get_items.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_items_throws_bad_request_error_with_wiremock
    test_id = "user.get_items.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.get_items(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.get_items.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_items_throws_unauthorized_error_with_wiremock
    test_id = "user.get_items.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.get_items(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.get_items.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_items_throws_too_many_requests_error_with_wiremock
    test_id = "user.get_items.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.get_items(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.get_items.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_items_throws_internal_server_error_with_wiremock
    test_id = "user.get_items.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.get_items(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.get_items.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_items_throws_client_request_error_with_wiremock
    test_id = "user.get_items.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.get_items(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.get_items.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_get_items_throws_server_error_with_wiremock
    test_id = "user.get_items.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.get_items(request_options: {
        additional_headers: {
          "X-Test-Id" => "user.get_items.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_associate_items_with_wiremock
    test_id = "user.associate_items.0"

    @client.user.associate_items(
      user_id: "user_id",
      item_ids: ["item_ids"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.associate_items.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/associate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_associate_items_throws_bad_request_error_with_wiremock
    test_id = "user.associate_items.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.associate_items(
        user_id: "user_id",
        item_ids: %w[item_ids item_ids],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.associate_items.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/associate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_associate_items_throws_unauthorized_error_with_wiremock
    test_id = "user.associate_items.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.associate_items(
        user_id: "user_id",
        item_ids: %w[item_ids item_ids],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.associate_items.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/associate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_associate_items_throws_too_many_requests_error_with_wiremock
    test_id = "user.associate_items.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.associate_items(
        user_id: "user_id",
        item_ids: %w[item_ids item_ids],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.associate_items.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/associate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_associate_items_throws_internal_server_error_with_wiremock
    test_id = "user.associate_items.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.associate_items(
        user_id: "user_id",
        item_ids: %w[item_ids item_ids],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.associate_items.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/associate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_associate_items_throws_client_request_error_with_wiremock
    test_id = "user.associate_items.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.associate_items(
        user_id: "user_id",
        item_ids: %w[item_ids item_ids],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.associate_items.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/associate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_associate_items_throws_server_error_with_wiremock
    test_id = "user.associate_items.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.associate_items(
        user_id: "user_id",
        item_ids: %w[item_ids item_ids],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.associate_items.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/associate",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_items_with_wiremock
    test_id = "user.remove_items.0"

    @client.user.remove_items(
      item_ids: ["item_ids"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.remove_items.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_items_throws_bad_request_error_with_wiremock
    test_id = "user.remove_items.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.remove_items(
        item_ids: %w[item_ids item_ids],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_items.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_items_throws_unauthorized_error_with_wiremock
    test_id = "user.remove_items.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.remove_items(
        item_ids: %w[item_ids item_ids],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_items.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_items_throws_too_many_requests_error_with_wiremock
    test_id = "user.remove_items.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.remove_items(
        item_ids: %w[item_ids item_ids],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_items.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_items_throws_internal_server_error_with_wiremock
    test_id = "user.remove_items.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.remove_items(
        item_ids: %w[item_ids item_ids],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_items.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_items_throws_client_request_error_with_wiremock
    test_id = "user.remove_items.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.remove_items(
        item_ids: %w[item_ids item_ids],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_items.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_items_throws_server_error_with_wiremock
    test_id = "user.remove_items.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.remove_items(
        item_ids: %w[item_ids item_ids],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_items.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/items/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_third_party_token_with_wiremock
    test_id = "user.create_third_party_token.0"

    @client.user.create_third_party_token(
      third_party_client_id: "third_party_client_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.create_third_party_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_third_party_token_throws_bad_request_error_with_wiremock
    test_id = "user.create_third_party_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.create_third_party_token(
        third_party_client_id: "third_party_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.create_third_party_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_third_party_token_throws_unauthorized_error_with_wiremock
    test_id = "user.create_third_party_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.create_third_party_token(
        third_party_client_id: "third_party_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.create_third_party_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_third_party_token_throws_too_many_requests_error_with_wiremock
    test_id = "user.create_third_party_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.create_third_party_token(
        third_party_client_id: "third_party_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.create_third_party_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_third_party_token_throws_internal_server_error_with_wiremock
    test_id = "user.create_third_party_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.create_third_party_token(
        third_party_client_id: "third_party_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.create_third_party_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_third_party_token_throws_client_request_error_with_wiremock
    test_id = "user.create_third_party_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.create_third_party_token(
        third_party_client_id: "third_party_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.create_third_party_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_create_third_party_token_throws_server_error_with_wiremock
    test_id = "user.create_third_party_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.create_third_party_token(
        third_party_client_id: "third_party_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.create_third_party_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_third_party_token_with_wiremock
    test_id = "user.remove_third_party_token.0"

    @client.user.remove_third_party_token(
      third_party_user_token: "third_party_user_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.remove_third_party_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_third_party_token_throws_bad_request_error_with_wiremock
    test_id = "user.remove_third_party_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.remove_third_party_token(
        third_party_user_token: "third_party_user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_third_party_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_third_party_token_throws_unauthorized_error_with_wiremock
    test_id = "user.remove_third_party_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.remove_third_party_token(
        third_party_user_token: "third_party_user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_third_party_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_third_party_token_throws_too_many_requests_error_with_wiremock
    test_id = "user.remove_third_party_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.remove_third_party_token(
        third_party_user_token: "third_party_user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_third_party_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_third_party_token_throws_internal_server_error_with_wiremock
    test_id = "user.remove_third_party_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.remove_third_party_token(
        third_party_user_token: "third_party_user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_third_party_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_third_party_token_throws_client_request_error_with_wiremock
    test_id = "user.remove_third_party_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.remove_third_party_token(
        third_party_user_token: "third_party_user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_third_party_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_remove_third_party_token_throws_server_error_with_wiremock
    test_id = "user.remove_third_party_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.remove_third_party_token(
        third_party_user_token: "third_party_user_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.remove_third_party_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user/third_party_token/remove",
      query_params: nil,
      expected: 1
    )
  end
end
