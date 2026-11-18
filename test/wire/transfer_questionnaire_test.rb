# frozen_string_literal: true

require_relative "wiremock_test_case"

class TransferQuestionnaireWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_transfer_questionnaire_create_with_wiremock
    test_id = "transfer.questionnaire.create.0"

    @client.transfer.questionnaire.create(
      originator_client_id: "originator_client_id",
      redirect_uri: "redirect_uri",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.questionnaire.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/questionnaire/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_questionnaire_create_throws_bad_request_error_with_wiremock
    test_id = "transfer.questionnaire.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.questionnaire.create(
        originator_client_id: "originator_client_id",
        redirect_uri: "redirect_uri",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.questionnaire.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/questionnaire/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_questionnaire_create_throws_unauthorized_error_with_wiremock
    test_id = "transfer.questionnaire.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.questionnaire.create(
        originator_client_id: "originator_client_id",
        redirect_uri: "redirect_uri",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.questionnaire.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/questionnaire/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_questionnaire_create_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.questionnaire.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.questionnaire.create(
        originator_client_id: "originator_client_id",
        redirect_uri: "redirect_uri",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.questionnaire.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/questionnaire/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_questionnaire_create_throws_internal_server_error_with_wiremock
    test_id = "transfer.questionnaire.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.questionnaire.create(
        originator_client_id: "originator_client_id",
        redirect_uri: "redirect_uri",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.questionnaire.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/questionnaire/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_questionnaire_create_throws_client_request_error_with_wiremock
    test_id = "transfer.questionnaire.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.questionnaire.create(
        originator_client_id: "originator_client_id",
        redirect_uri: "redirect_uri",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.questionnaire.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/questionnaire/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_questionnaire_create_throws_server_error_with_wiremock
    test_id = "transfer.questionnaire.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.questionnaire.create(
        originator_client_id: "originator_client_id",
        redirect_uri: "redirect_uri",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.questionnaire.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/questionnaire/create",
      query_params: nil,
      expected: 1
    )
  end
end
