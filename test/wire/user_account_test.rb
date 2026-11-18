# frozen_string_literal: true

require_relative "wiremock_test_case"

class UserAccountWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_user_account_get_session_with_wiremock
    test_id = "user.account.get_session.0"

    result = @client.user.account.get_session(
      public_token: "public_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.account.get_session.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/identity_edit_history/name/edits_current" => 0,
        "/identity_edit_history/name/edits_1d" => 0,
        "/identity_edit_history/name/edits_30d" => 1,
        "/identity_edit_history/name/edits_365d" => 1,
        "/identity_edit_history/name/edits_all_time" => 1,
        "/identity_edit_history/address/edits_current" => 1,
        "/identity_edit_history/address/edits_1d" => 1,
        "/identity_edit_history/address/edits_30d" => 2,
        "/identity_edit_history/address/edits_365d" => 2,
        "/identity_edit_history/address/edits_all_time" => 2,
        "/identity_edit_history/email/edits_current" => 0,
        "/identity_edit_history/email/edits_1d" => 0,
        "/identity_edit_history/email/edits_30d" => 0,
        "/identity_edit_history/email/edits_365d" => 0,
        "/identity_edit_history/email/edits_all_time" => 0,
        "/identity_edit_history/date_of_birth/edits_current" => 0,
        "/identity_edit_history/date_of_birth/edits_1d" => 0,
        "/identity_edit_history/date_of_birth/edits_30d" => 0,
        "/identity_edit_history/date_of_birth/edits_365d" => 0,
        "/identity_edit_history/date_of_birth/edits_all_time" => 0,
        "/identity_edit_history/official_document/ssn/edits_current" => 0,
        "/identity_edit_history/official_document/ssn/edits_1d" => 0,
        "/identity_edit_history/official_document/ssn/edits_30d" => 0,
        "/identity_edit_history/official_document/ssn/edits_365d" => 0,
        "/identity_edit_history/official_document/ssn/edits_all_time" => 0
      }
    )
  end

  def test_user_account_get_session_throws_bad_request_error_with_wiremock
    test_id = "user.account.get_session.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.account.get_session(
        public_token: "public_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.account.get_session.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_account_get_session_throws_unauthorized_error_with_wiremock
    test_id = "user.account.get_session.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.account.get_session(
        public_token: "public_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.account.get_session.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_account_get_session_throws_too_many_requests_error_with_wiremock
    test_id = "user.account.get_session.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.account.get_session(
        public_token: "public_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.account.get_session.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_account_get_session_throws_internal_server_error_with_wiremock
    test_id = "user.account.get_session.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.account.get_session(
        public_token: "public_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.account.get_session.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_account_get_session_throws_client_request_error_with_wiremock
    test_id = "user.account.get_session.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.account.get_session(
        public_token: "public_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.account.get_session.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_account_get_session_throws_server_error_with_wiremock
    test_id = "user.account.get_session.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.account.get_session(
        public_token: "public_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.account.get_session.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_account_send_session_event_with_wiremock
    test_id = "user.account.send_session_event.0"

    @client.user.account.send_session_event(
      link_session_id: "link_session_id",
      event: {
        name: "name",
        timestamp: "2024-01-15T09:30:00Z"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "user.account.send_session_event.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/event/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_account_send_session_event_throws_bad_request_error_with_wiremock
    test_id = "user.account.send_session_event.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.account.send_session_event(
        link_session_id: "link_session_id",
        event: {
          name: "name",
          timestamp: "2024-01-15T09:30:00Z"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.account.send_session_event.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/event/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_account_send_session_event_throws_unauthorized_error_with_wiremock
    test_id = "user.account.send_session_event.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.user.account.send_session_event(
        link_session_id: "link_session_id",
        event: {
          name: "name",
          timestamp: "2024-01-15T09:30:00Z"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.account.send_session_event.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/event/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_account_send_session_event_throws_too_many_requests_error_with_wiremock
    test_id = "user.account.send_session_event.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.account.send_session_event(
        link_session_id: "link_session_id",
        event: {
          name: "name",
          timestamp: "2024-01-15T09:30:00Z"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.account.send_session_event.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/event/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_account_send_session_event_throws_internal_server_error_with_wiremock
    test_id = "user.account.send_session_event.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.account.send_session_event(
        link_session_id: "link_session_id",
        event: {
          name: "name",
          timestamp: "2024-01-15T09:30:00Z"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.account.send_session_event.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/event/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_account_send_session_event_throws_client_request_error_with_wiremock
    test_id = "user.account.send_session_event.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.user.account.send_session_event(
        link_session_id: "link_session_id",
        event: {
          name: "name",
          timestamp: "2024-01-15T09:30:00Z"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.account.send_session_event.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/event/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_user_account_send_session_event_throws_server_error_with_wiremock
    test_id = "user.account.send_session_event.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.user.account.send_session_event(
        link_session_id: "link_session_id",
        event: {
          name: "name",
          timestamp: "2024-01-15T09:30:00Z"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "user.account.send_session_event.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/user_account/session/event/send",
      query_params: nil,
      expected: 1
    )
  end
end
