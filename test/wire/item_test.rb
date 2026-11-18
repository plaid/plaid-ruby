# frozen_string_literal: true

require_relative "wiremock_test_case"

class ItemWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_item_list_activity_with_wiremock
    test_id = "item.list_activity.0"

    result = @client.item.list_activity(request_options: {
      additional_headers: {
        "X-Test-Id" => "item.list_activity.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/activity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_activity_throws_bad_request_error_with_wiremock
    test_id = "item.list_activity.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.list_activity(request_options: {
        additional_headers: {
          "X-Test-Id" => "item.list_activity.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/activity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_activity_throws_unauthorized_error_with_wiremock
    test_id = "item.list_activity.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.item.list_activity(request_options: {
        additional_headers: {
          "X-Test-Id" => "item.list_activity.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/activity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_activity_throws_too_many_requests_error_with_wiremock
    test_id = "item.list_activity.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.list_activity(request_options: {
        additional_headers: {
          "X-Test-Id" => "item.list_activity.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/activity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_activity_throws_internal_server_error_with_wiremock
    test_id = "item.list_activity.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.list_activity(request_options: {
        additional_headers: {
          "X-Test-Id" => "item.list_activity.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/activity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_activity_throws_client_request_error_with_wiremock
    test_id = "item.list_activity.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.list_activity(request_options: {
        additional_headers: {
          "X-Test-Id" => "item.list_activity.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/activity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_activity_throws_server_error_with_wiremock
    test_id = "item.list_activity.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.list_activity(request_options: {
        additional_headers: {
          "X-Test-Id" => "item.list_activity.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/activity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_applications_with_wiremock
    test_id = "item.list_applications.0"

    @client.item.list_applications(request_options: {
      additional_headers: {
        "X-Test-Id" => "item.list_applications.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_applications_throws_bad_request_error_with_wiremock
    test_id = "item.list_applications.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.list_applications(request_options: {
        additional_headers: {
          "X-Test-Id" => "item.list_applications.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_applications_throws_unauthorized_error_with_wiremock
    test_id = "item.list_applications.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.item.list_applications(request_options: {
        additional_headers: {
          "X-Test-Id" => "item.list_applications.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_applications_throws_too_many_requests_error_with_wiremock
    test_id = "item.list_applications.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.list_applications(request_options: {
        additional_headers: {
          "X-Test-Id" => "item.list_applications.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_applications_throws_internal_server_error_with_wiremock
    test_id = "item.list_applications.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.list_applications(request_options: {
        additional_headers: {
          "X-Test-Id" => "item.list_applications.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_applications_throws_client_request_error_with_wiremock
    test_id = "item.list_applications.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.list_applications(request_options: {
        additional_headers: {
          "X-Test-Id" => "item.list_applications.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_list_applications_throws_server_error_with_wiremock
    test_id = "item.list_applications.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.list_applications(request_options: {
        additional_headers: {
          "X-Test-Id" => "item.list_applications.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_unlink_application_with_wiremock
    test_id = "item.unlink_application.0"

    @client.item.unlink_application(
      access_token: "access_token",
      application_id: "application_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "item.unlink_application.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/unlink",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_unlink_application_throws_bad_request_error_with_wiremock
    test_id = "item.unlink_application.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.unlink_application(
        access_token: "access_token",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.unlink_application.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/unlink",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_unlink_application_throws_unauthorized_error_with_wiremock
    test_id = "item.unlink_application.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.item.unlink_application(
        access_token: "access_token",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.unlink_application.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/unlink",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_unlink_application_throws_too_many_requests_error_with_wiremock
    test_id = "item.unlink_application.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.unlink_application(
        access_token: "access_token",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.unlink_application.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/unlink",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_unlink_application_throws_internal_server_error_with_wiremock
    test_id = "item.unlink_application.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.unlink_application(
        access_token: "access_token",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.unlink_application.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/unlink",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_unlink_application_throws_client_request_error_with_wiremock
    test_id = "item.unlink_application.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.unlink_application(
        access_token: "access_token",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.unlink_application.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/unlink",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_unlink_application_throws_server_error_with_wiremock
    test_id = "item.unlink_application.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.unlink_application(
        access_token: "access_token",
        application_id: "application_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.unlink_application.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/unlink",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_application_scopes_with_wiremock
    test_id = "item.update_application_scopes.0"

    @client.item.update_application_scopes(
      access_token: "access_token",
      application_id: "application_id",
      scopes: {},
      context: "ENROLLMENT",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "item.update_application_scopes.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/scopes/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_application_scopes_throws_bad_request_error_with_wiremock
    test_id = "item.update_application_scopes.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.update_application_scopes(
        access_token: "access_token",
        application_id: "application_id",
        scopes: {},
        context: "ENROLLMENT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.update_application_scopes.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/scopes/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_application_scopes_throws_unauthorized_error_with_wiremock
    test_id = "item.update_application_scopes.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.item.update_application_scopes(
        access_token: "access_token",
        application_id: "application_id",
        scopes: {},
        context: "ENROLLMENT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.update_application_scopes.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/scopes/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_application_scopes_throws_too_many_requests_error_with_wiremock
    test_id = "item.update_application_scopes.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.update_application_scopes(
        access_token: "access_token",
        application_id: "application_id",
        scopes: {},
        context: "ENROLLMENT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.update_application_scopes.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/scopes/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_application_scopes_throws_internal_server_error_with_wiremock
    test_id = "item.update_application_scopes.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.update_application_scopes(
        access_token: "access_token",
        application_id: "application_id",
        scopes: {},
        context: "ENROLLMENT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.update_application_scopes.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/scopes/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_application_scopes_throws_client_request_error_with_wiremock
    test_id = "item.update_application_scopes.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.update_application_scopes(
        access_token: "access_token",
        application_id: "application_id",
        scopes: {},
        context: "ENROLLMENT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.update_application_scopes.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/scopes/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_application_scopes_throws_server_error_with_wiremock
    test_id = "item.update_application_scopes.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.update_application_scopes(
        access_token: "access_token",
        application_id: "application_id",
        scopes: {},
        context: "ENROLLMENT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.update_application_scopes.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/application/scopes/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_get_with_wiremock
    test_id = "item.get.0"

    @client.item.get(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "item.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_get_throws_bad_request_error_with_wiremock
    test_id = "item.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_get_throws_unauthorized_error_with_wiremock
    test_id = "item.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.item.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_get_throws_too_many_requests_error_with_wiremock
    test_id = "item.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_get_throws_internal_server_error_with_wiremock
    test_id = "item.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_get_throws_client_request_error_with_wiremock
    test_id = "item.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_get_throws_server_error_with_wiremock
    test_id = "item.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.get(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_remove_with_wiremock
    test_id = "item.remove.0"

    @client.item.remove(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "item.remove.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_remove_throws_bad_request_error_with_wiremock
    test_id = "item.remove.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.remove(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.remove.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_remove_throws_unauthorized_error_with_wiremock
    test_id = "item.remove.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.item.remove(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.remove.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_remove_throws_too_many_requests_error_with_wiremock
    test_id = "item.remove.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.remove(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.remove.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_remove_throws_internal_server_error_with_wiremock
    test_id = "item.remove.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.remove(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.remove.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_remove_throws_client_request_error_with_wiremock
    test_id = "item.remove.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.remove(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.remove.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_remove_throws_server_error_with_wiremock
    test_id = "item.remove.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.remove(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.remove.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_terminate_products_with_wiremock
    test_id = "item.terminate_products.0"

    @client.item.terminate_products(
      access_token: "access_token",
      reason_code: "FRAUD_FIRST_PARTY",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "item.terminate_products.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_terminate_products_throws_bad_request_error_with_wiremock
    test_id = "item.terminate_products.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.terminate_products(
        access_token: "access_token",
        reason_code: "FRAUD_FIRST_PARTY",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.terminate_products.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_terminate_products_throws_unauthorized_error_with_wiremock
    test_id = "item.terminate_products.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.item.terminate_products(
        access_token: "access_token",
        reason_code: "FRAUD_FIRST_PARTY",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.terminate_products.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_terminate_products_throws_too_many_requests_error_with_wiremock
    test_id = "item.terminate_products.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.terminate_products(
        access_token: "access_token",
        reason_code: "FRAUD_FIRST_PARTY",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.terminate_products.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_terminate_products_throws_internal_server_error_with_wiremock
    test_id = "item.terminate_products.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.terminate_products(
        access_token: "access_token",
        reason_code: "FRAUD_FIRST_PARTY",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.terminate_products.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_terminate_products_throws_client_request_error_with_wiremock
    test_id = "item.terminate_products.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.terminate_products(
        access_token: "access_token",
        reason_code: "FRAUD_FIRST_PARTY",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.terminate_products.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_terminate_products_throws_server_error_with_wiremock
    test_id = "item.terminate_products.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.terminate_products(
        access_token: "access_token",
        reason_code: "FRAUD_FIRST_PARTY",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.terminate_products.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/products/terminate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_webhook_with_wiremock
    test_id = "item.update_webhook.0"

    @client.item.update_webhook(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "item.update_webhook.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_webhook_throws_bad_request_error_with_wiremock
    test_id = "item.update_webhook.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.update_webhook(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.update_webhook.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_webhook_throws_unauthorized_error_with_wiremock
    test_id = "item.update_webhook.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.item.update_webhook(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.update_webhook.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_webhook_throws_too_many_requests_error_with_wiremock
    test_id = "item.update_webhook.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.update_webhook(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.update_webhook.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_webhook_throws_internal_server_error_with_wiremock
    test_id = "item.update_webhook.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.update_webhook(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.update_webhook.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_webhook_throws_client_request_error_with_wiremock
    test_id = "item.update_webhook.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.update_webhook(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.update_webhook.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_update_webhook_throws_server_error_with_wiremock
    test_id = "item.update_webhook.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.update_webhook(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.update_webhook.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/webhook/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_invalidate_access_token_with_wiremock
    test_id = "item.invalidate_access_token.0"

    @client.item.invalidate_access_token(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "item.invalidate_access_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/access_token/invalidate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_invalidate_access_token_throws_bad_request_error_with_wiremock
    test_id = "item.invalidate_access_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.invalidate_access_token(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.invalidate_access_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/access_token/invalidate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_invalidate_access_token_throws_unauthorized_error_with_wiremock
    test_id = "item.invalidate_access_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.item.invalidate_access_token(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.invalidate_access_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/access_token/invalidate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_invalidate_access_token_throws_too_many_requests_error_with_wiremock
    test_id = "item.invalidate_access_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.invalidate_access_token(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.invalidate_access_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/access_token/invalidate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_invalidate_access_token_throws_internal_server_error_with_wiremock
    test_id = "item.invalidate_access_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.invalidate_access_token(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.invalidate_access_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/access_token/invalidate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_invalidate_access_token_throws_client_request_error_with_wiremock
    test_id = "item.invalidate_access_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.invalidate_access_token(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.invalidate_access_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/access_token/invalidate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_invalidate_access_token_throws_server_error_with_wiremock
    test_id = "item.invalidate_access_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.invalidate_access_token(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.invalidate_access_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/access_token/invalidate",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_exchange_public_token_with_wiremock
    test_id = "item.exchange_public_token.0"

    @client.item.exchange_public_token(
      public_token: "public_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "item.exchange_public_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_exchange_public_token_throws_bad_request_error_with_wiremock
    test_id = "item.exchange_public_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.exchange_public_token(
        public_token: "public_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.exchange_public_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_exchange_public_token_throws_unauthorized_error_with_wiremock
    test_id = "item.exchange_public_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.item.exchange_public_token(
        public_token: "public_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.exchange_public_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_exchange_public_token_throws_too_many_requests_error_with_wiremock
    test_id = "item.exchange_public_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.exchange_public_token(
        public_token: "public_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.exchange_public_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_exchange_public_token_throws_internal_server_error_with_wiremock
    test_id = "item.exchange_public_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.exchange_public_token(
        public_token: "public_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.exchange_public_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_exchange_public_token_throws_client_request_error_with_wiremock
    test_id = "item.exchange_public_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.exchange_public_token(
        public_token: "public_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.exchange_public_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_exchange_public_token_throws_server_error_with_wiremock
    test_id = "item.exchange_public_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.exchange_public_token(
        public_token: "public_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.exchange_public_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/exchange",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_create_public_token_with_wiremock
    test_id = "item.create_public_token.0"

    @client.item.create_public_token(
      access_token: "access_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "item.create_public_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_create_public_token_throws_bad_request_error_with_wiremock
    test_id = "item.create_public_token.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.create_public_token(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.create_public_token.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_create_public_token_throws_unauthorized_error_with_wiremock
    test_id = "item.create_public_token.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.item.create_public_token(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.create_public_token.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_create_public_token_throws_too_many_requests_error_with_wiremock
    test_id = "item.create_public_token.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.create_public_token(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.create_public_token.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_create_public_token_throws_internal_server_error_with_wiremock
    test_id = "item.create_public_token.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.create_public_token(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.create_public_token.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_create_public_token_throws_client_request_error_with_wiremock
    test_id = "item.create_public_token.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.create_public_token(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.create_public_token.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_create_public_token_throws_server_error_with_wiremock
    test_id = "item.create_public_token.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.create_public_token(
        access_token: "access_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.create_public_token.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/public_token/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_import_with_wiremock
    test_id = "item.import.0"

    @client.item.import(
      user_auth: {
        user_id: "user_id"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "item.import.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/import",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_import_throws_bad_request_error_with_wiremock
    test_id = "item.import.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.import(
        user_auth: {
          user_id: "user_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.import.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/import",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_import_throws_unauthorized_error_with_wiremock
    test_id = "item.import.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.item.import(
        user_auth: {
          user_id: "user_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.import.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/import",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_import_throws_too_many_requests_error_with_wiremock
    test_id = "item.import.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.import(
        user_auth: {
          user_id: "user_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.import.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/import",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_import_throws_internal_server_error_with_wiremock
    test_id = "item.import.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.import(
        user_auth: {
          user_id: "user_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.import.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/import",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_import_throws_client_request_error_with_wiremock
    test_id = "item.import.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.item.import(
        user_auth: {
          user_id: "user_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.import.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/import",
      query_params: nil,
      expected: 1
    )
  end

  def test_item_import_throws_server_error_with_wiremock
    test_id = "item.import.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.item.import(
        user_auth: {
          user_id: "user_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "item.import.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/item/import",
      query_params: nil,
      expected: 1
    )
  end
end
