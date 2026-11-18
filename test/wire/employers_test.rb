# frozen_string_literal: true

require_relative "wiremock_test_case"

class EmployersWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_employers_search_with_wiremock
    test_id = "employers.search.0"

    result = @client.employers.search(
      query: "query",
      products: ["products"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "employers.search.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/employers/search",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/employers/0/confidence_score" => 1
      }
    )
  end

  def test_employers_search_throws_bad_request_error_with_wiremock
    test_id = "employers.search.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.employers.search(
        query: "query",
        products: %w[products products],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "employers.search.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/employers/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_employers_search_throws_unauthorized_error_with_wiremock
    test_id = "employers.search.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.employers.search(
        query: "query",
        products: %w[products products],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "employers.search.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/employers/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_employers_search_throws_too_many_requests_error_with_wiremock
    test_id = "employers.search.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.employers.search(
        query: "query",
        products: %w[products products],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "employers.search.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/employers/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_employers_search_throws_internal_server_error_with_wiremock
    test_id = "employers.search.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.employers.search(
        query: "query",
        products: %w[products products],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "employers.search.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/employers/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_employers_search_throws_client_request_error_with_wiremock
    test_id = "employers.search.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.employers.search(
        query: "query",
        products: %w[products products],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "employers.search.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/employers/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_employers_search_throws_server_error_with_wiremock
    test_id = "employers.search.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.employers.search(
        query: "query",
        products: %w[products products],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "employers.search.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/employers/search",
      query_params: nil,
      expected: 1
    )
  end
end
