# frozen_string_literal: true

require_relative "wiremock_test_case"

class BeaconDuplicateWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_beacon_duplicate_get_with_wiremock
    test_id = "beacon_duplicate.get.0"

    result = @client.beacon_duplicate.get(
      beacon_duplicate_id: "becdup_11111111111111",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "beacon_duplicate.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/duplicate/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/beacon_user1/version" => 1,
        "/beacon_user2/version" => 1
      }
    )
  end

  def test_beacon_duplicate_get_throws_bad_request_error_with_wiremock
    test_id = "beacon_duplicate.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_duplicate.get(
        beacon_duplicate_id: "beacon_duplicate_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_duplicate.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/duplicate/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_duplicate_get_throws_unauthorized_error_with_wiremock
    test_id = "beacon_duplicate.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.beacon_duplicate.get(
        beacon_duplicate_id: "beacon_duplicate_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_duplicate.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/duplicate/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_duplicate_get_throws_too_many_requests_error_with_wiremock
    test_id = "beacon_duplicate.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_duplicate.get(
        beacon_duplicate_id: "beacon_duplicate_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_duplicate.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/duplicate/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_duplicate_get_throws_internal_server_error_with_wiremock
    test_id = "beacon_duplicate.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_duplicate.get(
        beacon_duplicate_id: "beacon_duplicate_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_duplicate.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/duplicate/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_duplicate_get_throws_client_request_error_with_wiremock
    test_id = "beacon_duplicate.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.beacon_duplicate.get(
        beacon_duplicate_id: "beacon_duplicate_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_duplicate.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/duplicate/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_beacon_duplicate_get_throws_server_error_with_wiremock
    test_id = "beacon_duplicate.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.beacon_duplicate.get(
        beacon_duplicate_id: "beacon_duplicate_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "beacon_duplicate.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beacon/duplicate/get",
      query_params: nil,
      expected: 1
    )
  end
end
