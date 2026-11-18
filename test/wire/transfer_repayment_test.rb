# frozen_string_literal: true

require_relative "wiremock_test_case"

class TransferRepaymentWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_transfer_repayment_list_with_wiremock
    test_id = "transfer.repayment.list.0"

    result = @client.transfer.repayment.list(
      start_date: "2022-01-10T12:34:56Z",
      count: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.repayment.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/list",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/list",
      expected: {
        "/count" => 1
      }
    )
  end

  def test_transfer_repayment_list_throws_bad_request_error_with_wiremock
    test_id = "transfer.repayment.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.repayment.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.repayment.list.1"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_repayment_list_throws_unauthorized_error_with_wiremock
    test_id = "transfer.repayment.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.repayment.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.repayment.list.2"
        }
      }).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_repayment_list_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.repayment.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.repayment.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.repayment.list.3"
        }
      }).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_repayment_list_throws_internal_server_error_with_wiremock
    test_id = "transfer.repayment.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.repayment.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.repayment.list.4"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_repayment_list_throws_client_request_error_with_wiremock
    test_id = "transfer.repayment.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.repayment.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.repayment.list.5"
        }
      }).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_repayment_list_throws_server_error_with_wiremock
    test_id = "transfer.repayment.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.repayment.list(request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.repayment.list.6"
        }
      }).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_repayment_list_returns_with_wiremock
    test_id = "transfer.repayment.list_returns.0"

    result = @client.transfer.repayment.list_returns(
      repayment_id: "d4bfce70-2470-4298-ae87-5e9b3e18bfaf",
      count: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.repayment.list_returns.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/return/list",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/return/list",
      expected: {
        "/count" => 1
      }
    )
  end

  def test_transfer_repayment_list_returns_throws_bad_request_error_with_wiremock
    test_id = "transfer.repayment.list_returns.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.repayment.list_returns(
        repayment_id: "repayment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.repayment.list_returns.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/return/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_repayment_list_returns_throws_unauthorized_error_with_wiremock
    test_id = "transfer.repayment.list_returns.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.repayment.list_returns(
        repayment_id: "repayment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.repayment.list_returns.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/return/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_repayment_list_returns_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.repayment.list_returns.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.repayment.list_returns(
        repayment_id: "repayment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.repayment.list_returns.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/return/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_repayment_list_returns_throws_internal_server_error_with_wiremock
    test_id = "transfer.repayment.list_returns.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.repayment.list_returns(
        repayment_id: "repayment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.repayment.list_returns.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/return/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_repayment_list_returns_throws_client_request_error_with_wiremock
    test_id = "transfer.repayment.list_returns.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.repayment.list_returns(
        repayment_id: "repayment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.repayment.list_returns.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/return/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_repayment_list_returns_throws_server_error_with_wiremock
    test_id = "transfer.repayment.list_returns.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.repayment.list_returns(
        repayment_id: "repayment_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.repayment.list_returns.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/repayment/return/list",
      query_params: nil,
      expected: 1
    )
  end
end
