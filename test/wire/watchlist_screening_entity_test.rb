# frozen_string_literal: true

require_relative "wiremock_test_case"

class WatchlistScreeningEntityWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_watchlist_screening_entity_create_with_wiremock
    test_id = "watchlist_screening_entity.create.0"

    result = @client.watchlist_screening_entity.create(
      search_terms: {
        entity_watchlist_program_id: "entprg_2eRPsDnL66rZ7H",
        legal_name: "Al-Qaida"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/create",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/search_terms/version" => 1
      }
    )
  end

  def test_watchlist_screening_entity_create_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_entity.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.create(
        search_terms: {
          entity_watchlist_program_id: "entity_watchlist_program_id",
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_create_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_entity.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_entity.create(
        search_terms: {
          entity_watchlist_program_id: "entity_watchlist_program_id",
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_create_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_entity.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.create(
        search_terms: {
          entity_watchlist_program_id: "entity_watchlist_program_id",
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_create_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_entity.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.create(
        search_terms: {
          entity_watchlist_program_id: "entity_watchlist_program_id",
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_create_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_entity.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.create(
        search_terms: {
          entity_watchlist_program_id: "entity_watchlist_program_id",
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_create_throws_server_error_with_wiremock
    test_id = "watchlist_screening_entity.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.create(
        search_terms: {
          entity_watchlist_program_id: "entity_watchlist_program_id",
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_with_wiremock
    test_id = "watchlist_screening_entity.get.0"

    result = @client.watchlist_screening_entity.get(
      entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/search_terms/version" => 1
      }
    )
  end

  def test_watchlist_screening_entity_get_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_entity.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.get(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_entity.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_entity.get(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_entity.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.get(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_entity.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.get(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_entity.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.get(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_throws_server_error_with_wiremock
    test_id = "watchlist_screening_entity.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.get(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_history_with_wiremock
    test_id = "watchlist_screening_entity.list_history.0"

    result = @client.watchlist_screening_entity.list_history(
      entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.list_history.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_history_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_entity.list_history.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list_history(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_history.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_history_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_entity.list_history.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_entity.list_history(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_history.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_history_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_entity.list_history.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list_history(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_history.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_history_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_entity.list_history.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.list_history(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_history.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_history_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_entity.list_history.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list_history(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_history.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_history_throws_server_error_with_wiremock
    test_id = "watchlist_screening_entity.list_history.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.list_history(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_history.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_hits_with_wiremock
    test_id = "watchlist_screening_entity.list_hits.0"

    result = @client.watchlist_screening_entity.list_hits(
      entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.list_hits.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_hits_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_entity.list_hits.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list_hits(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_hits.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_hits_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_entity.list_hits.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_entity.list_hits(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_hits.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_hits_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_entity.list_hits.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list_hits(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_hits.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_hits_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_entity.list_hits.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.list_hits(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_hits.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_hits_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_entity.list_hits.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list_hits(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_hits.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_hits_throws_server_error_with_wiremock
    test_id = "watchlist_screening_entity.list_hits.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.list_hits(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_hits.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_with_wiremock
    test_id = "watchlist_screening_entity.list.0"

    result = @client.watchlist_screening_entity.list(
      entity_watchlist_program_id: "entprg_2eRPsDnL66rZ7H",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_entity.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list(
        entity_watchlist_program_id: "entity_watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_entity.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_entity.list(
        entity_watchlist_program_id: "entity_watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_entity.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list(
        entity_watchlist_program_id: "entity_watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_entity.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.list(
        entity_watchlist_program_id: "entity_watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_entity.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list(
        entity_watchlist_program_id: "entity_watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_throws_server_error_with_wiremock
    test_id = "watchlist_screening_entity.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.list(
        entity_watchlist_program_id: "entity_watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_program_with_wiremock
    test_id = "watchlist_screening_entity.get_program.0"

    @client.watchlist_screening_entity.get_program(
      entity_watchlist_program_id: "entprg_2eRPsDnL66rZ7H",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.get_program.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_program_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_entity.get_program.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.get_program(
        entity_watchlist_program_id: "entity_watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.get_program.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_program_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_entity.get_program.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_entity.get_program(
        entity_watchlist_program_id: "entity_watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.get_program.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_program_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_entity.get_program.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.get_program(
        entity_watchlist_program_id: "entity_watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.get_program.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_program_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_entity.get_program.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.get_program(
        entity_watchlist_program_id: "entity_watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.get_program.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_program_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_entity.get_program.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.get_program(
        entity_watchlist_program_id: "entity_watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.get_program.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_get_program_throws_server_error_with_wiremock
    test_id = "watchlist_screening_entity.get_program.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.get_program(
        entity_watchlist_program_id: "entity_watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.get_program.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_programs_with_wiremock
    test_id = "watchlist_screening_entity.list_programs.0"

    result = @client.watchlist_screening_entity.list_programs(request_options: {
      additional_headers: {
        "X-Test-Id" => "watchlist_screening_entity.list_programs.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_programs_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_entity.list_programs.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list_programs(request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.list_programs.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_programs_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_entity.list_programs.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_entity.list_programs(request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.list_programs.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_programs_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_entity.list_programs.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list_programs(request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.list_programs.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_programs_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_entity.list_programs.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.list_programs(request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.list_programs.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_programs_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_entity.list_programs.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list_programs(request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.list_programs.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_programs_throws_server_error_with_wiremock
    test_id = "watchlist_screening_entity.list_programs.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.list_programs(request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.list_programs.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_create_review_with_wiremock
    test_id = "watchlist_screening_entity.create_review.0"

    @client.watchlist_screening_entity.create_review(
      confirmed_hits: ["enthit_52xR9LKo77r1Np"],
      dismissed_hits: ["enthit_52xR9LKo77r1Np"],
      entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.create_review.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_create_review_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_entity.create_review.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.create_review(
        confirmed_hits: %w[confirmed_hits confirmed_hits],
        dismissed_hits: %w[dismissed_hits dismissed_hits],
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.create_review.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_create_review_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_entity.create_review.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_entity.create_review(
        confirmed_hits: %w[confirmed_hits confirmed_hits],
        dismissed_hits: %w[dismissed_hits dismissed_hits],
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.create_review.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_create_review_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_entity.create_review.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.create_review(
        confirmed_hits: %w[confirmed_hits confirmed_hits],
        dismissed_hits: %w[dismissed_hits dismissed_hits],
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.create_review.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_create_review_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_entity.create_review.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.create_review(
        confirmed_hits: %w[confirmed_hits confirmed_hits],
        dismissed_hits: %w[dismissed_hits dismissed_hits],
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.create_review.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_create_review_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_entity.create_review.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.create_review(
        confirmed_hits: %w[confirmed_hits confirmed_hits],
        dismissed_hits: %w[dismissed_hits dismissed_hits],
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.create_review.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_create_review_throws_server_error_with_wiremock
    test_id = "watchlist_screening_entity.create_review.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.create_review(
        confirmed_hits: %w[confirmed_hits confirmed_hits],
        dismissed_hits: %w[dismissed_hits dismissed_hits],
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.create_review.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_reviews_with_wiremock
    test_id = "watchlist_screening_entity.list_reviews.0"

    result = @client.watchlist_screening_entity.list_reviews(
      entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.list_reviews.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_reviews_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_entity.list_reviews.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list_reviews(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_reviews.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_reviews_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_entity.list_reviews.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_entity.list_reviews(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_reviews.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_reviews_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_entity.list_reviews.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list_reviews(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_reviews.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_reviews_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_entity.list_reviews.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.list_reviews(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_reviews.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_reviews_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_entity.list_reviews.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.list_reviews(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_reviews.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_list_reviews_throws_server_error_with_wiremock
    test_id = "watchlist_screening_entity.list_reviews.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.list_reviews(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.list_reviews.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_update_with_wiremock
    test_id = "watchlist_screening_entity.update.0"

    result = @client.watchlist_screening_entity.update(
      entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_entity.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/update",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/search_terms/version" => 1
      }
    )
  end

  def test_watchlist_screening_entity_update_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_entity.update.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.update(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.update.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_update_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_entity.update.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_entity.update(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.update.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_update_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_entity.update.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.update(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.update.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_update_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_entity.update.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.update(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.update.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_update_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_entity.update.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_entity.update(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.update.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_entity_update_throws_server_error_with_wiremock
    test_id = "watchlist_screening_entity.update.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_entity.update(
        entity_watchlist_screening_id: "entity_watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_entity.update.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/entity/update",
      query_params: nil,
      expected: 1
    )
  end
end
