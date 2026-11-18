# frozen_string_literal: true

require_relative "wiremock_test_case"

class WatchlistScreeningIndividualWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_watchlist_screening_individual_create_with_wiremock
    test_id = "watchlist_screening_individual.create.0"

    result = @client.watchlist_screening_individual.create(
      search_terms: {
        watchlist_program_id: "prg_2eRPsDnL66rZ7H",
        legal_name: "Aleksey Potemkin"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/create",
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

  def test_watchlist_screening_individual_create_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_individual.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.create(
        search_terms: {
          watchlist_program_id: "watchlist_program_id",
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_create_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_individual.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_individual.create(
        search_terms: {
          watchlist_program_id: "watchlist_program_id",
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_create_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_individual.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.create(
        search_terms: {
          watchlist_program_id: "watchlist_program_id",
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_create_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_individual.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.create(
        search_terms: {
          watchlist_program_id: "watchlist_program_id",
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_create_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_individual.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.create(
        search_terms: {
          watchlist_program_id: "watchlist_program_id",
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_create_throws_server_error_with_wiremock
    test_id = "watchlist_screening_individual.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.create(
        search_terms: {
          watchlist_program_id: "watchlist_program_id",
          legal_name: "legal_name"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_with_wiremock
    test_id = "watchlist_screening_individual.get.0"

    result = @client.watchlist_screening_individual.get(
      watchlist_screening_id: "scr_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/get",
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

  def test_watchlist_screening_individual_get_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_individual.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.get(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_individual.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_individual.get(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_individual.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.get(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_individual.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.get(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_individual.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.get(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_throws_server_error_with_wiremock
    test_id = "watchlist_screening_individual.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.get(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_history_with_wiremock
    test_id = "watchlist_screening_individual.list_history.0"

    result = @client.watchlist_screening_individual.list_history(
      watchlist_screening_id: "scr_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.list_history.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_history_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_individual.list_history.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list_history(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_history.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_history_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_individual.list_history.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_individual.list_history(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_history.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_history_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_individual.list_history.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list_history(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_history.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_history_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_individual.list_history.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.list_history(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_history.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_history_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_individual.list_history.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list_history(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_history.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_history_throws_server_error_with_wiremock
    test_id = "watchlist_screening_individual.list_history.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.list_history(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_history.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/history/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_hits_with_wiremock
    test_id = "watchlist_screening_individual.list_hits.0"

    result = @client.watchlist_screening_individual.list_hits(
      watchlist_screening_id: "scr_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.list_hits.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_hits_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_individual.list_hits.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list_hits(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_hits.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_hits_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_individual.list_hits.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_individual.list_hits(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_hits.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_hits_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_individual.list_hits.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list_hits(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_hits.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_hits_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_individual.list_hits.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.list_hits(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_hits.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_hits_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_individual.list_hits.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list_hits(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_hits.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_hits_throws_server_error_with_wiremock
    test_id = "watchlist_screening_individual.list_hits.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.list_hits(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_hits.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/hit/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_with_wiremock
    test_id = "watchlist_screening_individual.list.0"

    result = @client.watchlist_screening_individual.list(
      watchlist_program_id: "prg_2eRPsDnL66rZ7H",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_individual.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list(
        watchlist_program_id: "watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_individual.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_individual.list(
        watchlist_program_id: "watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_individual.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list(
        watchlist_program_id: "watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_individual.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.list(
        watchlist_program_id: "watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_individual.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list(
        watchlist_program_id: "watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_throws_server_error_with_wiremock
    test_id = "watchlist_screening_individual.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.list(
        watchlist_program_id: "watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_program_with_wiremock
    test_id = "watchlist_screening_individual.get_program.0"

    @client.watchlist_screening_individual.get_program(
      watchlist_program_id: "prg_2eRPsDnL66rZ7H",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.get_program.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_program_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_individual.get_program.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.get_program(
        watchlist_program_id: "watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.get_program.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_program_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_individual.get_program.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_individual.get_program(
        watchlist_program_id: "watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.get_program.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_program_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_individual.get_program.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.get_program(
        watchlist_program_id: "watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.get_program.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_program_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_individual.get_program.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.get_program(
        watchlist_program_id: "watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.get_program.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_program_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_individual.get_program.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.get_program(
        watchlist_program_id: "watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.get_program.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_get_program_throws_server_error_with_wiremock
    test_id = "watchlist_screening_individual.get_program.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.get_program(
        watchlist_program_id: "watchlist_program_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.get_program.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_programs_with_wiremock
    test_id = "watchlist_screening_individual.list_programs.0"

    result = @client.watchlist_screening_individual.list_programs(request_options: {
      additional_headers: {
        "X-Test-Id" => "watchlist_screening_individual.list_programs.0"
      }
    })
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_programs_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_individual.list_programs.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list_programs(request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.list_programs.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_programs_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_individual.list_programs.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_individual.list_programs(request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.list_programs.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_programs_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_individual.list_programs.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list_programs(request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.list_programs.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_programs_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_individual.list_programs.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.list_programs(request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.list_programs.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_programs_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_individual.list_programs.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list_programs(request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.list_programs.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_programs_throws_server_error_with_wiremock
    test_id = "watchlist_screening_individual.list_programs.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.list_programs(request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.list_programs.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/program/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_create_review_with_wiremock
    test_id = "watchlist_screening_individual.create_review.0"

    @client.watchlist_screening_individual.create_review(
      confirmed_hits: ["scrhit_52xR9LKo77r1Np"],
      dismissed_hits: ["scrhit_52xR9LKo77r1Np"],
      watchlist_screening_id: "scr_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.create_review.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_create_review_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_individual.create_review.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.create_review(
        confirmed_hits: %w[confirmed_hits confirmed_hits],
        dismissed_hits: %w[dismissed_hits dismissed_hits],
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.create_review.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_create_review_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_individual.create_review.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_individual.create_review(
        confirmed_hits: %w[confirmed_hits confirmed_hits],
        dismissed_hits: %w[dismissed_hits dismissed_hits],
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.create_review.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_create_review_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_individual.create_review.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.create_review(
        confirmed_hits: %w[confirmed_hits confirmed_hits],
        dismissed_hits: %w[dismissed_hits dismissed_hits],
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.create_review.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_create_review_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_individual.create_review.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.create_review(
        confirmed_hits: %w[confirmed_hits confirmed_hits],
        dismissed_hits: %w[dismissed_hits dismissed_hits],
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.create_review.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_create_review_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_individual.create_review.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.create_review(
        confirmed_hits: %w[confirmed_hits confirmed_hits],
        dismissed_hits: %w[dismissed_hits dismissed_hits],
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.create_review.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_create_review_throws_server_error_with_wiremock
    test_id = "watchlist_screening_individual.create_review.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.create_review(
        confirmed_hits: %w[confirmed_hits confirmed_hits],
        dismissed_hits: %w[dismissed_hits dismissed_hits],
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.create_review.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_reviews_with_wiremock
    test_id = "watchlist_screening_individual.list_reviews.0"

    result = @client.watchlist_screening_individual.list_reviews(
      watchlist_screening_id: "scr_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.list_reviews.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_reviews_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_individual.list_reviews.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list_reviews(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_reviews.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_reviews_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_individual.list_reviews.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_individual.list_reviews(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_reviews.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_reviews_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_individual.list_reviews.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list_reviews(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_reviews.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_reviews_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_individual.list_reviews.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.list_reviews(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_reviews.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_reviews_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_individual.list_reviews.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.list_reviews(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_reviews.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_list_reviews_throws_server_error_with_wiremock
    test_id = "watchlist_screening_individual.list_reviews.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.list_reviews(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.list_reviews.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/review/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_update_with_wiremock
    test_id = "watchlist_screening_individual.update.0"

    result = @client.watchlist_screening_individual.update(
      watchlist_screening_id: "scr_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "watchlist_screening_individual.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/update",
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

  def test_watchlist_screening_individual_update_throws_bad_request_error_with_wiremock
    test_id = "watchlist_screening_individual.update.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.update(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.update.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_update_throws_unauthorized_error_with_wiremock
    test_id = "watchlist_screening_individual.update.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.watchlist_screening_individual.update(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.update.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_update_throws_too_many_requests_error_with_wiremock
    test_id = "watchlist_screening_individual.update.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.update(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.update.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_update_throws_internal_server_error_with_wiremock
    test_id = "watchlist_screening_individual.update.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.update(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.update.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_update_throws_client_request_error_with_wiremock
    test_id = "watchlist_screening_individual.update.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.watchlist_screening_individual.update(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.update.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_watchlist_screening_individual_update_throws_server_error_with_wiremock
    test_id = "watchlist_screening_individual.update.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.watchlist_screening_individual.update(
        watchlist_screening_id: "watchlist_screening_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "watchlist_screening_individual.update.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/watchlist_screening/individual/update",
      query_params: nil,
      expected: 1
    )
  end
end
