# frozen_string_literal: true

require_relative "wiremock_test_case"

class ServicingSubscriptionWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_servicing_subscription_create_with_wiremock
    test_id = "servicing.subscription.create.0"

    @client.servicing.subscription.create(
      user_id: "user_id",
      scope: "PLAID_NETWORK",
      products: [],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "servicing.subscription.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_create_throws_bad_request_error_with_wiremock
    test_id = "servicing.subscription.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.create(
        user_id: "user_id",
        scope: "PLAID_NETWORK",
        products: [],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_create_throws_unauthorized_error_with_wiremock
    test_id = "servicing.subscription.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.servicing.subscription.create(
        user_id: "user_id",
        scope: "PLAID_NETWORK",
        products: [],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_create_throws_too_many_requests_error_with_wiremock
    test_id = "servicing.subscription.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.create(
        user_id: "user_id",
        scope: "PLAID_NETWORK",
        products: [],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_create_throws_internal_server_error_with_wiremock
    test_id = "servicing.subscription.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.servicing.subscription.create(
        user_id: "user_id",
        scope: "PLAID_NETWORK",
        products: [],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_create_throws_client_request_error_with_wiremock
    test_id = "servicing.subscription.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.create(
        user_id: "user_id",
        scope: "PLAID_NETWORK",
        products: [],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_create_throws_server_error_with_wiremock
    test_id = "servicing.subscription.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.servicing.subscription.create(
        user_id: "user_id",
        scope: "PLAID_NETWORK",
        products: [],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_delete_with_wiremock
    test_id = "servicing.subscription.delete.0"

    @client.servicing.subscription.delete(
      subscription_id: "subscription_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "servicing.subscription.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_delete_throws_bad_request_error_with_wiremock
    test_id = "servicing.subscription.delete.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.delete(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.delete.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_delete_throws_unauthorized_error_with_wiremock
    test_id = "servicing.subscription.delete.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.servicing.subscription.delete(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.delete.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_delete_throws_too_many_requests_error_with_wiremock
    test_id = "servicing.subscription.delete.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.delete(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.delete.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_delete_throws_internal_server_error_with_wiremock
    test_id = "servicing.subscription.delete.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.servicing.subscription.delete(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.delete.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_delete_throws_client_request_error_with_wiremock
    test_id = "servicing.subscription.delete.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.delete(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.delete.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_delete_throws_server_error_with_wiremock
    test_id = "servicing.subscription.delete.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.servicing.subscription.delete(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.delete.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_get_with_wiremock
    test_id = "servicing.subscription.get.0"

    @client.servicing.subscription.get(
      subscription_id: "subscription_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "servicing.subscription.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_get_throws_bad_request_error_with_wiremock
    test_id = "servicing.subscription.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.get(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_get_throws_unauthorized_error_with_wiremock
    test_id = "servicing.subscription.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.servicing.subscription.get(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_get_throws_too_many_requests_error_with_wiremock
    test_id = "servicing.subscription.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.get(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_get_throws_internal_server_error_with_wiremock
    test_id = "servicing.subscription.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.servicing.subscription.get(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_get_throws_client_request_error_with_wiremock
    test_id = "servicing.subscription.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.get(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_get_throws_server_error_with_wiremock
    test_id = "servicing.subscription.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.servicing.subscription.get(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_list_with_wiremock
    test_id = "servicing.subscription.list.0"

    @client.servicing.subscription.list(
      user_id: "user_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "servicing.subscription.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_list_throws_bad_request_error_with_wiremock
    test_id = "servicing.subscription.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.list(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.list.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_list_throws_unauthorized_error_with_wiremock
    test_id = "servicing.subscription.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.servicing.subscription.list(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.list.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_list_throws_too_many_requests_error_with_wiremock
    test_id = "servicing.subscription.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.list(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.list.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_list_throws_internal_server_error_with_wiremock
    test_id = "servicing.subscription.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.servicing.subscription.list(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.list.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_list_throws_client_request_error_with_wiremock
    test_id = "servicing.subscription.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.list(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.list.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_list_throws_server_error_with_wiremock
    test_id = "servicing.subscription.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.servicing.subscription.list(
        user_id: "user_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.list.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_update_with_wiremock
    test_id = "servicing.subscription.update.0"

    @client.servicing.subscription.update(
      subscription_id: "subscription_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "servicing.subscription.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_update_throws_bad_request_error_with_wiremock
    test_id = "servicing.subscription.update.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.update(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.update.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_update_throws_unauthorized_error_with_wiremock
    test_id = "servicing.subscription.update.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.servicing.subscription.update(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.update.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_update_throws_too_many_requests_error_with_wiremock
    test_id = "servicing.subscription.update.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.update(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.update.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_update_throws_internal_server_error_with_wiremock
    test_id = "servicing.subscription.update.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.servicing.subscription.update(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.update.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_update_throws_client_request_error_with_wiremock
    test_id = "servicing.subscription.update.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.servicing.subscription.update(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.update.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_servicing_subscription_update_throws_server_error_with_wiremock
    test_id = "servicing.subscription.update.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.servicing.subscription.update(
        subscription_id: "subscription_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "servicing.subscription.update.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/servicing/subscription/update",
      query_params: nil,
      expected: 1
    )
  end
end
