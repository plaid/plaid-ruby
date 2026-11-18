# frozen_string_literal: true

require_relative "wiremock_test_case"

class AssetReportWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_asset_report_create_with_wiremock
    test_id = "asset_report.create.0"

    @client.asset_report.create(
      days_requested: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      expected: {
        "/days_requested" => 1
      }
    )
  end

  def test_asset_report_create_throws_bad_request_error_with_wiremock
    test_id = "asset_report.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.create(
        days_requested: 731,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      expected: {
        "/days_requested" => 731
      }
    )
  end

  def test_asset_report_create_throws_unauthorized_error_with_wiremock
    test_id = "asset_report.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.asset_report.create(
        days_requested: 731,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      expected: {
        "/days_requested" => 731
      }
    )
  end

  def test_asset_report_create_throws_too_many_requests_error_with_wiremock
    test_id = "asset_report.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.create(
        days_requested: 731,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      expected: {
        "/days_requested" => 731
      }
    )
  end

  def test_asset_report_create_throws_internal_server_error_with_wiremock
    test_id = "asset_report.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.create(
        days_requested: 731,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      expected: {
        "/days_requested" => 731
      }
    )
  end

  def test_asset_report_create_throws_client_request_error_with_wiremock
    test_id = "asset_report.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.create(
        days_requested: 731,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      expected: {
        "/days_requested" => 731
      }
    )
  end

  def test_asset_report_create_throws_server_error_with_wiremock
    test_id = "asset_report.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.create(
        days_requested: 731,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/create",
      expected: {
        "/days_requested" => 731
      }
    )
  end

  def test_asset_report_get_with_wiremock
    test_id = "asset_report.get.0"

    result = @client.asset_report.get(request_options: {
      additional_headers: {
        "X-Test-Id" => "asset_report.get.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/get",
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

  def test_asset_report_get_throws_bad_request_error_with_wiremock
    test_id = "asset_report.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.get.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_throws_unauthorized_error_with_wiremock
    test_id = "asset_report.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.asset_report.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.get.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_throws_too_many_requests_error_with_wiremock
    test_id = "asset_report.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.get.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_throws_internal_server_error_with_wiremock
    test_id = "asset_report.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.get.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_throws_client_request_error_with_wiremock
    test_id = "asset_report.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.get.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_throws_server_error_with_wiremock
    test_id = "asset_report.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.get(request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.get.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_pdf_with_wiremock
    test_id = "asset_report.get_pdf.0"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.get_pdf(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_pdf.0"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_pdf_throws_unauthorized_error_with_wiremock
    test_id = "asset_report.get_pdf.1"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.asset_report.get_pdf(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_pdf.1"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_pdf_throws_too_many_requests_error_with_wiremock
    test_id = "asset_report.get_pdf.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.get_pdf(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_pdf.2"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_pdf_throws_internal_server_error_with_wiremock
    test_id = "asset_report.get_pdf.3"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.get_pdf(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_pdf.3"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_pdf_throws_client_request_error_with_wiremock
    test_id = "asset_report.get_pdf.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.get_pdf(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_pdf.4"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_pdf_throws_server_error_with_wiremock
    test_id = "asset_report.get_pdf.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.get_pdf(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_pdf.5"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_refresh_with_wiremock
    test_id = "asset_report.refresh.0"

    @client.asset_report.refresh(
      asset_report_token: "asset_report_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.refresh.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_refresh_throws_bad_request_error_with_wiremock
    test_id = "asset_report.refresh.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.refresh(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.refresh.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_refresh_throws_unauthorized_error_with_wiremock
    test_id = "asset_report.refresh.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.asset_report.refresh(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.refresh.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_refresh_throws_too_many_requests_error_with_wiremock
    test_id = "asset_report.refresh.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.refresh(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.refresh.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_refresh_throws_internal_server_error_with_wiremock
    test_id = "asset_report.refresh.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.refresh(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.refresh.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_refresh_throws_client_request_error_with_wiremock
    test_id = "asset_report.refresh.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.refresh(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.refresh.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_refresh_throws_server_error_with_wiremock
    test_id = "asset_report.refresh.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.refresh(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.refresh.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/refresh",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_filter_with_wiremock
    test_id = "asset_report.filter.0"

    @client.asset_report.filter(
      asset_report_token: "asset_report_token",
      account_ids_to_exclude: ["account_ids_to_exclude"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.filter.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/filter",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_filter_throws_bad_request_error_with_wiremock
    test_id = "asset_report.filter.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.filter(
        asset_report_token: "asset_report_token",
        account_ids_to_exclude: %w[account_ids_to_exclude account_ids_to_exclude],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.filter.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/filter",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_filter_throws_unauthorized_error_with_wiremock
    test_id = "asset_report.filter.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.asset_report.filter(
        asset_report_token: "asset_report_token",
        account_ids_to_exclude: %w[account_ids_to_exclude account_ids_to_exclude],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.filter.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/filter",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_filter_throws_too_many_requests_error_with_wiremock
    test_id = "asset_report.filter.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.filter(
        asset_report_token: "asset_report_token",
        account_ids_to_exclude: %w[account_ids_to_exclude account_ids_to_exclude],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.filter.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/filter",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_filter_throws_internal_server_error_with_wiremock
    test_id = "asset_report.filter.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.filter(
        asset_report_token: "asset_report_token",
        account_ids_to_exclude: %w[account_ids_to_exclude account_ids_to_exclude],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.filter.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/filter",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_filter_throws_client_request_error_with_wiremock
    test_id = "asset_report.filter.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.filter(
        asset_report_token: "asset_report_token",
        account_ids_to_exclude: %w[account_ids_to_exclude account_ids_to_exclude],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.filter.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/filter",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_filter_throws_server_error_with_wiremock
    test_id = "asset_report.filter.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.filter(
        asset_report_token: "asset_report_token",
        account_ids_to_exclude: %w[account_ids_to_exclude account_ids_to_exclude],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.filter.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/filter",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_with_wiremock
    test_id = "asset_report.remove.0"

    @client.asset_report.remove(
      asset_report_token: "asset_report_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.remove.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_throws_bad_request_error_with_wiremock
    test_id = "asset_report.remove.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.remove(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.remove.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_throws_unauthorized_error_with_wiremock
    test_id = "asset_report.remove.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.asset_report.remove(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.remove.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_throws_too_many_requests_error_with_wiremock
    test_id = "asset_report.remove.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.remove(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.remove.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_throws_internal_server_error_with_wiremock
    test_id = "asset_report.remove.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.remove(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.remove.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_throws_client_request_error_with_wiremock
    test_id = "asset_report.remove.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.remove(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.remove.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_throws_server_error_with_wiremock
    test_id = "asset_report.remove.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.remove(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.remove.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_create_audit_copy_with_wiremock
    test_id = "asset_report.create_audit_copy.0"

    @client.asset_report.create_audit_copy(
      asset_report_token: "asset_report_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.create_audit_copy.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_create_audit_copy_throws_bad_request_error_with_wiremock
    test_id = "asset_report.create_audit_copy.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.create_audit_copy(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.create_audit_copy.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_create_audit_copy_throws_unauthorized_error_with_wiremock
    test_id = "asset_report.create_audit_copy.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.asset_report.create_audit_copy(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.create_audit_copy.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_create_audit_copy_throws_too_many_requests_error_with_wiremock
    test_id = "asset_report.create_audit_copy.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.create_audit_copy(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.create_audit_copy.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_create_audit_copy_throws_internal_server_error_with_wiremock
    test_id = "asset_report.create_audit_copy.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.create_audit_copy(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.create_audit_copy.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_create_audit_copy_throws_client_request_error_with_wiremock
    test_id = "asset_report.create_audit_copy.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.create_audit_copy(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.create_audit_copy.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_create_audit_copy_throws_server_error_with_wiremock
    test_id = "asset_report.create_audit_copy.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.create_audit_copy(
        asset_report_token: "asset_report_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.create_audit_copy.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_audit_copy_with_wiremock
    test_id = "asset_report.get_audit_copy.0"

    result = @client.asset_report.get_audit_copy(
      audit_copy_token: "audit_copy_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.get_audit_copy.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/report/days_requested" => 1.1,
        "/report/items/0/accounts/0/days_available" => 1.1,
        "/report/items/0/accounts/0/transactions/0/amount" => 1.1,
        "/report/items/0/accounts/0/historical_balances/0/current" => 1.1
      }
    )
  end

  def test_asset_report_get_audit_copy_throws_bad_request_error_with_wiremock
    test_id = "asset_report.get_audit_copy.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.get_audit_copy(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_audit_copy.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_audit_copy_throws_unauthorized_error_with_wiremock
    test_id = "asset_report.get_audit_copy.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.asset_report.get_audit_copy(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_audit_copy.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_audit_copy_throws_too_many_requests_error_with_wiremock
    test_id = "asset_report.get_audit_copy.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.get_audit_copy(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_audit_copy.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_audit_copy_throws_internal_server_error_with_wiremock
    test_id = "asset_report.get_audit_copy.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.get_audit_copy(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_audit_copy.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_audit_copy_throws_client_request_error_with_wiremock
    test_id = "asset_report.get_audit_copy.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.get_audit_copy(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_audit_copy.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_audit_copy_throws_server_error_with_wiremock
    test_id = "asset_report.get_audit_copy.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.get_audit_copy(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_audit_copy.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_audit_copy_pdf_with_wiremock
    test_id = "asset_report.get_audit_copy_pdf.0"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.get_audit_copy_pdf(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_audit_copy_pdf.0"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_audit_copy_pdf_throws_unauthorized_error_with_wiremock
    test_id = "asset_report.get_audit_copy_pdf.1"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.asset_report.get_audit_copy_pdf(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_audit_copy_pdf.1"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_audit_copy_pdf_throws_too_many_requests_error_with_wiremock
    test_id = "asset_report.get_audit_copy_pdf.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.get_audit_copy_pdf(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_audit_copy_pdf.2"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_audit_copy_pdf_throws_internal_server_error_with_wiremock
    test_id = "asset_report.get_audit_copy_pdf.3"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.get_audit_copy_pdf(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_audit_copy_pdf.3"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_audit_copy_pdf_throws_client_request_error_with_wiremock
    test_id = "asset_report.get_audit_copy_pdf.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.get_audit_copy_pdf(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_audit_copy_pdf.4"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_get_audit_copy_pdf_throws_server_error_with_wiremock
    test_id = "asset_report.get_audit_copy_pdf.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.get_audit_copy_pdf(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.get_audit_copy_pdf.5"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_audit_copy_with_wiremock
    test_id = "asset_report.remove_audit_copy.0"

    @client.asset_report.remove_audit_copy(
      audit_copy_token: "audit_copy_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "asset_report.remove_audit_copy.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_audit_copy_throws_bad_request_error_with_wiremock
    test_id = "asset_report.remove_audit_copy.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.remove_audit_copy(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.remove_audit_copy.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_audit_copy_throws_unauthorized_error_with_wiremock
    test_id = "asset_report.remove_audit_copy.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.asset_report.remove_audit_copy(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.remove_audit_copy.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_audit_copy_throws_too_many_requests_error_with_wiremock
    test_id = "asset_report.remove_audit_copy.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.remove_audit_copy(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.remove_audit_copy.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_audit_copy_throws_internal_server_error_with_wiremock
    test_id = "asset_report.remove_audit_copy.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.remove_audit_copy(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.remove_audit_copy.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_audit_copy_throws_client_request_error_with_wiremock
    test_id = "asset_report.remove_audit_copy.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.asset_report.remove_audit_copy(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.remove_audit_copy.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_asset_report_remove_audit_copy_throws_server_error_with_wiremock
    test_id = "asset_report.remove_audit_copy.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.asset_report.remove_audit_copy(
        audit_copy_token: "audit_copy_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "asset_report.remove_audit_copy.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/asset_report/audit_copy/remove",
      query_params: nil,
      expected: 1
    )
  end
end
