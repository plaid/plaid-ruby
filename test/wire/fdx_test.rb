# frozen_string_literal: true

require_relative "wiremock_test_case"

class FdxWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_fdx_notifications_with_wiremock
    test_id = "fdx.notifications.0"

    @client.fdx.notifications(
      notification_id: "notificationId",
      type: "ACCOUNT_TAKEOVER",
      sent_on: "2021-07-15T14:46:41Z",
      category: "SECURITY",
      notification_payload: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "fdx.notifications.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/fdx/notifications",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_notifications_throws_bad_request_error_with_wiremock
    test_id = "fdx.notifications.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.notifications(
        notification_id: "notificationId",
        type: "ACCOUNT_TAKEOVER",
        sent_on: "2024-01-15T09:30:00Z",
        category: "SECURITY",
        notification_payload: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.notifications.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/fdx/notifications",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_notifications_throws_unauthorized_error_with_wiremock
    test_id = "fdx.notifications.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.fdx.notifications(
        notification_id: "notificationId",
        type: "ACCOUNT_TAKEOVER",
        sent_on: "2024-01-15T09:30:00Z",
        category: "SECURITY",
        notification_payload: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.notifications.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/fdx/notifications",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_notifications_throws_too_many_requests_error_with_wiremock
    test_id = "fdx.notifications.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.notifications(
        notification_id: "notificationId",
        type: "ACCOUNT_TAKEOVER",
        sent_on: "2024-01-15T09:30:00Z",
        category: "SECURITY",
        notification_payload: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.notifications.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/fdx/notifications",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_notifications_throws_internal_server_error_with_wiremock
    test_id = "fdx.notifications.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.notifications(
        notification_id: "notificationId",
        type: "ACCOUNT_TAKEOVER",
        sent_on: "2024-01-15T09:30:00Z",
        category: "SECURITY",
        notification_payload: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.notifications.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/fdx/notifications",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_notifications_throws_client_request_error_with_wiremock
    test_id = "fdx.notifications.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.notifications(
        notification_id: "notificationId",
        type: "ACCOUNT_TAKEOVER",
        sent_on: "2024-01-15T09:30:00Z",
        category: "SECURITY",
        notification_payload: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.notifications.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/fdx/notifications",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_notifications_throws_server_error_with_wiremock
    test_id = "fdx.notifications.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.notifications(
        notification_id: "notificationId",
        type: "ACCOUNT_TAKEOVER",
        sent_on: "2024-01-15T09:30:00Z",
        category: "SECURITY",
        notification_payload: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.notifications.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/fdx/notifications",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipients_with_wiremock
    test_id = "fdx.get_recipients.0"

    result = @client.fdx.get_recipients(request_options: {
      additional_headers: {
        "X-Test-Id" => "fdx.get_recipients.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipients",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/recipients/0/connection_count" => 128,
        "/recipients/1/connection_count" => 209
      }
    )
  end

  def test_fdx_get_recipients_throws_bad_request_error_with_wiremock
    test_id = "fdx.get_recipients.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_recipients(request_options: {
        additional_headers: {
          "X-Test-Id" => "fdx.get_recipients.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipients",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipients_throws_unauthorized_error_with_wiremock
    test_id = "fdx.get_recipients.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.fdx.get_recipients(request_options: {
        additional_headers: {
          "X-Test-Id" => "fdx.get_recipients.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipients",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipients_throws_too_many_requests_error_with_wiremock
    test_id = "fdx.get_recipients.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_recipients(request_options: {
        additional_headers: {
          "X-Test-Id" => "fdx.get_recipients.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipients",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipients_throws_internal_server_error_with_wiremock
    test_id = "fdx.get_recipients.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.get_recipients(request_options: {
        additional_headers: {
          "X-Test-Id" => "fdx.get_recipients.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipients",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipients_throws_client_request_error_with_wiremock
    test_id = "fdx.get_recipients.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_recipients(request_options: {
        additional_headers: {
          "X-Test-Id" => "fdx.get_recipients.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipients",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipients_throws_server_error_with_wiremock
    test_id = "fdx.get_recipients.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.get_recipients(request_options: {
        additional_headers: {
          "X-Test-Id" => "fdx.get_recipients.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipients",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consents_with_wiremock
    test_id = "fdx.get_consents.0"

    @client.fdx.get_consents(
      customer_id: "customerId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "fdx.get_consents.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents",
      query_params: { "customerId" => "customerId" },
      expected: 1
    )
  end

  def test_fdx_get_consents_throws_bad_request_error_with_wiremock
    test_id = "fdx.get_consents.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_consents(
        customer_id: "customerId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consents.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents",
      query_params: { "customerId" => "customerId" },
      expected: 1
    )
  end

  def test_fdx_get_consents_throws_unauthorized_error_with_wiremock
    test_id = "fdx.get_consents.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.fdx.get_consents(
        customer_id: "customerId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consents.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents",
      query_params: { "customerId" => "customerId" },
      expected: 1
    )
  end

  def test_fdx_get_consents_throws_too_many_requests_error_with_wiremock
    test_id = "fdx.get_consents.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_consents(
        customer_id: "customerId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consents.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents",
      query_params: { "customerId" => "customerId" },
      expected: 1
    )
  end

  def test_fdx_get_consents_throws_internal_server_error_with_wiremock
    test_id = "fdx.get_consents.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.get_consents(
        customer_id: "customerId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consents.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents",
      query_params: { "customerId" => "customerId" },
      expected: 1
    )
  end

  def test_fdx_get_consents_throws_client_request_error_with_wiremock
    test_id = "fdx.get_consents.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_consents(
        customer_id: "customerId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consents.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents",
      query_params: { "customerId" => "customerId" },
      expected: 1
    )
  end

  def test_fdx_get_consents_throws_server_error_with_wiremock
    test_id = "fdx.get_consents.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.get_consents(
        customer_id: "customerId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consents.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents",
      query_params: { "customerId" => "customerId" },
      expected: 1
    )
  end

  def test_fdx_get_consent_revocation_with_wiremock
    test_id = "fdx.get_consent_revocation.0"

    @client.fdx.get_consent_revocation(
      consent_id: "consentId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "fdx.get_consent_revocation.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_revocation_throws_bad_request_error_with_wiremock
    test_id = "fdx.get_consent_revocation.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_consent_revocation(
        consent_id: "consentId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consent_revocation.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_revocation_throws_unauthorized_error_with_wiremock
    test_id = "fdx.get_consent_revocation.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.fdx.get_consent_revocation(
        consent_id: "consentId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consent_revocation.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_revocation_throws_too_many_requests_error_with_wiremock
    test_id = "fdx.get_consent_revocation.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_consent_revocation(
        consent_id: "consentId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consent_revocation.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_revocation_throws_internal_server_error_with_wiremock
    test_id = "fdx.get_consent_revocation.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.get_consent_revocation(
        consent_id: "consentId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consent_revocation.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_revocation_throws_client_request_error_with_wiremock
    test_id = "fdx.get_consent_revocation.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_consent_revocation(
        consent_id: "consentId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consent_revocation.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_revocation_throws_server_error_with_wiremock
    test_id = "fdx.get_consent_revocation.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.get_consent_revocation(
        consent_id: "consentId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consent_revocation.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_revoke_consent_with_wiremock
    test_id = "fdx.revoke_consent.0"

    @client.fdx.revoke_consent(
      consent_id: "consentId",
      initiator: "DATA_ACCESS_PLATFORM",
      reason: "BUSINESS_RULE",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "fdx.revoke_consent.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_revoke_consent_throws_bad_request_error_with_wiremock
    test_id = "fdx.revoke_consent.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.revoke_consent(
        consent_id: "consentId",
        initiator: "DATA_ACCESS_PLATFORM",
        reason: "BUSINESS_RULE",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.revoke_consent.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_revoke_consent_throws_unauthorized_error_with_wiremock
    test_id = "fdx.revoke_consent.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.fdx.revoke_consent(
        consent_id: "consentId",
        initiator: "DATA_ACCESS_PLATFORM",
        reason: "BUSINESS_RULE",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.revoke_consent.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_revoke_consent_throws_too_many_requests_error_with_wiremock
    test_id = "fdx.revoke_consent.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.revoke_consent(
        consent_id: "consentId",
        initiator: "DATA_ACCESS_PLATFORM",
        reason: "BUSINESS_RULE",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.revoke_consent.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_revoke_consent_throws_internal_server_error_with_wiremock
    test_id = "fdx.revoke_consent.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.revoke_consent(
        consent_id: "consentId",
        initiator: "DATA_ACCESS_PLATFORM",
        reason: "BUSINESS_RULE",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.revoke_consent.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_revoke_consent_throws_client_request_error_with_wiremock
    test_id = "fdx.revoke_consent.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.revoke_consent(
        consent_id: "consentId",
        initiator: "DATA_ACCESS_PLATFORM",
        reason: "BUSINESS_RULE",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.revoke_consent.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_revoke_consent_throws_server_error_with_wiremock
    test_id = "fdx.revoke_consent.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.revoke_consent(
        consent_id: "consentId",
        initiator: "DATA_ACCESS_PLATFORM",
        reason: "BUSINESS_RULE",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.revoke_consent.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/fdx/consents/consentId/revocation",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_with_wiremock
    test_id = "fdx.get_consent.0"

    @client.fdx.get_consent(
      consent_id: "consentId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "fdx.get_consent.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_throws_bad_request_error_with_wiremock
    test_id = "fdx.get_consent.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_consent(
        consent_id: "consentId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consent.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_throws_unauthorized_error_with_wiremock
    test_id = "fdx.get_consent.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.fdx.get_consent(
        consent_id: "consentId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consent.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_throws_too_many_requests_error_with_wiremock
    test_id = "fdx.get_consent.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_consent(
        consent_id: "consentId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consent.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_throws_internal_server_error_with_wiremock
    test_id = "fdx.get_consent.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.get_consent(
        consent_id: "consentId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consent.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_throws_client_request_error_with_wiremock
    test_id = "fdx.get_consent.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_consent(
        consent_id: "consentId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consent.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_consent_throws_server_error_with_wiremock
    test_id = "fdx.get_consent.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.get_consent(
        consent_id: "consentId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_consent.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/consents/consentId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipient_with_wiremock
    test_id = "fdx.get_recipient.0"

    @client.fdx.get_recipient(
      recipient_id: "recipientId",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "fdx.get_recipient.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipient/recipientId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipient_throws_bad_request_error_with_wiremock
    test_id = "fdx.get_recipient.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_recipient(
        recipient_id: "recipientId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_recipient.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipient/recipientId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipient_throws_unauthorized_error_with_wiremock
    test_id = "fdx.get_recipient.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.fdx.get_recipient(
        recipient_id: "recipientId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_recipient.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipient/recipientId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipient_throws_too_many_requests_error_with_wiremock
    test_id = "fdx.get_recipient.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_recipient(
        recipient_id: "recipientId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_recipient.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipient/recipientId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipient_throws_internal_server_error_with_wiremock
    test_id = "fdx.get_recipient.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.get_recipient(
        recipient_id: "recipientId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_recipient.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipient/recipientId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipient_throws_client_request_error_with_wiremock
    test_id = "fdx.get_recipient.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.fdx.get_recipient(
        recipient_id: "recipientId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_recipient.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipient/recipientId",
      query_params: nil,
      expected: 1
    )
  end

  def test_fdx_get_recipient_throws_server_error_with_wiremock
    test_id = "fdx.get_recipient.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.fdx.get_recipient(
        recipient_id: "recipientId",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "fdx.get_recipient.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/fdx/recipient/recipientId",
      query_params: nil,
      expected: 1
    )
  end
end
