# frozen_string_literal: true

require_relative "wiremock_test_case"

class TransferOriginatorWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_transfer_originator_update_funding_account_with_wiremock
    test_id = "transfer.originator.update_funding_account.0"

    @client.transfer.originator.update_funding_account(
      originator_client_id: "originator_client_id",
      funding_account: {
        access_token: "access_token",
        account_id: "account_id"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.originator.update_funding_account.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_update_funding_account_throws_bad_request_error_with_wiremock
    test_id = "transfer.originator.update_funding_account.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.update_funding_account(
        originator_client_id: "originator_client_id",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.update_funding_account.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_update_funding_account_throws_unauthorized_error_with_wiremock
    test_id = "transfer.originator.update_funding_account.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.originator.update_funding_account(
        originator_client_id: "originator_client_id",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.update_funding_account.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_update_funding_account_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.originator.update_funding_account.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.update_funding_account(
        originator_client_id: "originator_client_id",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.update_funding_account.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_update_funding_account_throws_internal_server_error_with_wiremock
    test_id = "transfer.originator.update_funding_account.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.originator.update_funding_account(
        originator_client_id: "originator_client_id",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.update_funding_account.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_update_funding_account_throws_client_request_error_with_wiremock
    test_id = "transfer.originator.update_funding_account.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.update_funding_account(
        originator_client_id: "originator_client_id",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.update_funding_account.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_update_funding_account_throws_server_error_with_wiremock
    test_id = "transfer.originator.update_funding_account.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.originator.update_funding_account(
        originator_client_id: "originator_client_id",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.update_funding_account.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_funding_account_with_wiremock
    test_id = "transfer.originator.create_funding_account.0"

    @client.transfer.originator.create_funding_account(
      originator_client_id: "originator_client_id",
      funding_account: {
        access_token: "access_token",
        account_id: "account_id"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.originator.create_funding_account.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_funding_account_throws_bad_request_error_with_wiremock
    test_id = "transfer.originator.create_funding_account.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.create_funding_account(
        originator_client_id: "originator_client_id",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.create_funding_account.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_funding_account_throws_unauthorized_error_with_wiremock
    test_id = "transfer.originator.create_funding_account.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.originator.create_funding_account(
        originator_client_id: "originator_client_id",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.create_funding_account.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_funding_account_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.originator.create_funding_account.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.create_funding_account(
        originator_client_id: "originator_client_id",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.create_funding_account.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_funding_account_throws_internal_server_error_with_wiremock
    test_id = "transfer.originator.create_funding_account.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.originator.create_funding_account(
        originator_client_id: "originator_client_id",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.create_funding_account.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_funding_account_throws_client_request_error_with_wiremock
    test_id = "transfer.originator.create_funding_account.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.create_funding_account(
        originator_client_id: "originator_client_id",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.create_funding_account.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_funding_account_throws_server_error_with_wiremock
    test_id = "transfer.originator.create_funding_account.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.originator.create_funding_account(
        originator_client_id: "originator_client_id",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.create_funding_account.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/funding_account/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_with_wiremock
    test_id = "transfer.originator.create.0"

    @client.transfer.originator.create(
      company_name: "company_name",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.originator.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_throws_bad_request_error_with_wiremock
    test_id = "transfer.originator.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.create(
        company_name: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_throws_unauthorized_error_with_wiremock
    test_id = "transfer.originator.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.originator.create(
        company_name: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.originator.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.create(
        company_name: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_throws_internal_server_error_with_wiremock
    test_id = "transfer.originator.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.originator.create(
        company_name: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_throws_client_request_error_with_wiremock
    test_id = "transfer.originator.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.create(
        company_name: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_create_throws_server_error_with_wiremock
    test_id = "transfer.originator.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.originator.create(
        company_name: "x",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_get_with_wiremock
    test_id = "transfer.originator.get.0"

    @client.transfer.originator.get(
      originator_client_id: "originator_client_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.originator.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_get_throws_bad_request_error_with_wiremock
    test_id = "transfer.originator.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.get(
        originator_client_id: "originator_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_get_throws_unauthorized_error_with_wiremock
    test_id = "transfer.originator.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.originator.get(
        originator_client_id: "originator_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_get_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.originator.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.get(
        originator_client_id: "originator_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_get_throws_internal_server_error_with_wiremock
    test_id = "transfer.originator.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.originator.get(
        originator_client_id: "originator_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_get_throws_client_request_error_with_wiremock
    test_id = "transfer.originator.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.get(
        originator_client_id: "originator_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_get_throws_server_error_with_wiremock
    test_id = "transfer.originator.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.originator.get(
        originator_client_id: "originator_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.originator.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_list_with_wiremock
    test_id = "transfer.originator.list.0"

    result = @client.transfer.originator.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "transfer.originator.list.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_list_throws_bad_request_error_with_wiremock
    test_id = "transfer.originator.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.originator.list.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_list_throws_unauthorized_error_with_wiremock
    test_id = "transfer.originator.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.originator.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.originator.list.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_list_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.originator.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.originator.list.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_list_throws_internal_server_error_with_wiremock
    test_id = "transfer.originator.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.originator.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.originator.list.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_list_throws_client_request_error_with_wiremock
    test_id = "transfer.originator.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.originator.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.originator.list.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_originator_list_throws_server_error_with_wiremock
    test_id = "transfer.originator.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.originator.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.originator.list.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/originator/list",
      query_params: nil,
      expected: 1
    )
  end
end
