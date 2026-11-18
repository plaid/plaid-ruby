# frozen_string_literal: true

require_relative "wiremock_test_case"

class InstitutionsWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_institutions_get_with_wiremock
    test_id = "institutions.get.0"

    result = @client.institutions.get(
      count: 1,
      offset: 1,
      country_codes: ["US"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "institutions.get.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      expected: {
        "/count" => 1,
        "/offset" => 1
      }
    )
  end

  def test_institutions_get_throws_bad_request_error_with_wiremock
    test_id = "institutions.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.institutions.get(
        count: 500,
        offset: 1,
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.get.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      expected: {
        "/count" => 500,
        "/offset" => 1
      }
    )
  end

  def test_institutions_get_throws_unauthorized_error_with_wiremock
    test_id = "institutions.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.institutions.get(
        count: 500,
        offset: 1,
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.get.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      expected: {
        "/count" => 500,
        "/offset" => 1
      }
    )
  end

  def test_institutions_get_throws_too_many_requests_error_with_wiremock
    test_id = "institutions.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.institutions.get(
        count: 500,
        offset: 1,
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.get.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      expected: {
        "/count" => 500,
        "/offset" => 1
      }
    )
  end

  def test_institutions_get_throws_internal_server_error_with_wiremock
    test_id = "institutions.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.institutions.get(
        count: 500,
        offset: 1,
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.get.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      expected: {
        "/count" => 500,
        "/offset" => 1
      }
    )
  end

  def test_institutions_get_throws_client_request_error_with_wiremock
    test_id = "institutions.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.institutions.get(
        count: 500,
        offset: 1,
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.get.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      expected: {
        "/count" => 500,
        "/offset" => 1
      }
    )
  end

  def test_institutions_get_throws_server_error_with_wiremock
    test_id = "institutions.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.institutions.get(
        count: 500,
        offset: 1,
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.get.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get",
      expected: {
        "/count" => 500,
        "/offset" => 1
      }
    )
  end

  def test_institutions_search_with_wiremock
    test_id = "institutions.search.0"

    @client.institutions.search(
      query: "query",
      country_codes: ["US"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "institutions.search.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_institutions_search_throws_bad_request_error_with_wiremock
    test_id = "institutions.search.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.institutions.search(
        query: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.search.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_institutions_search_throws_unauthorized_error_with_wiremock
    test_id = "institutions.search.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.institutions.search(
        query: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.search.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_institutions_search_throws_too_many_requests_error_with_wiremock
    test_id = "institutions.search.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.institutions.search(
        query: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.search.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_institutions_search_throws_internal_server_error_with_wiremock
    test_id = "institutions.search.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.institutions.search(
        query: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.search.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_institutions_search_throws_client_request_error_with_wiremock
    test_id = "institutions.search.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.institutions.search(
        query: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.search.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_institutions_search_throws_server_error_with_wiremock
    test_id = "institutions.search.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.institutions.search(
        query: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.search.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_institutions_get_by_id_with_wiremock
    test_id = "institutions.get_by_id.0"

    result = @client.institutions.get_by_id(
      institution_id: "institution_id",
      country_codes: ["US"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "institutions.get_by_id.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get_by_id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/institution/status/item_logins/breakdown/success" => 0.9,
        "/institution/status/item_logins/breakdown/error_plaid" => 0.01,
        "/institution/status/item_logins/breakdown/error_institution" => 0.09,
        "/institution/status/transactions_updates/breakdown/success" => 0.95,
        "/institution/status/transactions_updates/breakdown/error_plaid" => 0.02,
        "/institution/status/transactions_updates/breakdown/error_institution" => 0.03,
        "/institution/status/auth/breakdown/success" => 0.91,
        "/institution/status/auth/breakdown/error_plaid" => 0.01,
        "/institution/status/auth/breakdown/error_institution" => 0.08,
        "/institution/status/identity/breakdown/success" => 0.42,
        "/institution/status/identity/breakdown/error_plaid" => 0.08,
        "/institution/status/identity/breakdown/error_institution" => 0.5,
        "/institution/status/investments_updates/breakdown/success" => 0.95,
        "/institution/status/investments_updates/breakdown/error_plaid" => 0.02,
        "/institution/status/investments_updates/breakdown/error_institution" => 0.03,
        "/institution/status/liabilities_updates/breakdown/success" => 0.95,
        "/institution/status/liabilities_updates/breakdown/error_plaid" => 0.02,
        "/institution/status/liabilities_updates/breakdown/error_institution" => 0.03,
        "/institution/status/liabilities/breakdown/success" => 0.89,
        "/institution/status/liabilities/breakdown/error_plaid" => 0.02,
        "/institution/status/liabilities/breakdown/error_institution" => 0.09,
        "/institution/status/investments/breakdown/success" => 0.89,
        "/institution/status/investments/breakdown/error_plaid" => 0.02,
        "/institution/status/investments/breakdown/error_institution" => 0.09
      }
    )
  end

  def test_institutions_get_by_id_throws_bad_request_error_with_wiremock
    test_id = "institutions.get_by_id.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.institutions.get_by_id(
        institution_id: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.get_by_id.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get_by_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_institutions_get_by_id_throws_unauthorized_error_with_wiremock
    test_id = "institutions.get_by_id.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.institutions.get_by_id(
        institution_id: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.get_by_id.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get_by_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_institutions_get_by_id_throws_too_many_requests_error_with_wiremock
    test_id = "institutions.get_by_id.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.institutions.get_by_id(
        institution_id: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.get_by_id.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get_by_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_institutions_get_by_id_throws_internal_server_error_with_wiremock
    test_id = "institutions.get_by_id.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.institutions.get_by_id(
        institution_id: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.get_by_id.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get_by_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_institutions_get_by_id_throws_client_request_error_with_wiremock
    test_id = "institutions.get_by_id.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.institutions.get_by_id(
        institution_id: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.get_by_id.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get_by_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_institutions_get_by_id_throws_server_error_with_wiremock
    test_id = "institutions.get_by_id.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.institutions.get_by_id(
        institution_id: "x",
        country_codes: %w[US US],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "institutions.get_by_id.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/institutions/get_by_id",
      query_params: nil,
      expected: 1
    )
  end
end
