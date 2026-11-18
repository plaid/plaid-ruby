# frozen_string_literal: true

require_relative "wiremock_test_case"

class IdentityVerificationWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_identity_verification_create_with_wiremock
    test_id = "identity.verification.create.0"

    result = @client.identity.verification.create(
      is_shareable: true,
      template_id: "idvtmp_4FrXJvfQU3zGUR",
      gave_consent: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "identity.verification.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/create",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/template/version" => 2,
        "/documentary_verification/documents/0/attempt" => 1,
        "/selfie_check/selfies/0/attempt" => 1,
        "/selfie_check/selfies/0/analysis/age_check/reported_age" => 36,
        "/selfie_check/selfies/0/analysis/age_check/age_estimate_lower_bound" => 32,
        "/selfie_check/selfies/0/analysis/age_check/age_estimate_upper_bound" => 38,
        "/risk_check/email/breach_count" => 1,
        "/risk_check/devices/0/ip_spam_list_count" => 1,
        "/risk_check/identity_abuse_signals/synthetic_identity/score" => 0,
        "/risk_check/identity_abuse_signals/stolen_identity/score" => 0,
        "/risk_check/facial_duplicates/0/similarity" => 95,
        "/risk_check/trust_index_score" => 86,
        "/verify_sms/verifications/0/attempt" => 1,
        "/verify_sms/verifications/0/delivery_attempt_count" => 1,
        "/verify_sms/verifications/0/solve_attempt_count" => 1,
        "/latest_scored_protect_event/trust_index/score" => 86,
        "/latest_scored_protect_event/trust_index/subscores/device_and_connection/score" => 87,
        "/latest_scored_protect_event/trust_index/subscores/bank_account_insights/score" => 85,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/link_session.linked_bank_accounts.connected_apps.days_since_first_connection" => 582,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.bank_accounts.num_of_frozen_or_restricted_accounts" => 0,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.linked_bank_accounts.num_family_names" => 1,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.linked_bank_accounts.num_of_connected_banks" => 1,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.link_sessions.days_since_first_link_session" => 150,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.pi.email.history_yrs" => 7.03,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.pi.email.num_social_networks_linked" => 12
      }
    )
  end

  def test_identity_verification_create_throws_bad_request_error_with_wiremock
    test_id = "identity.verification.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.create(
        is_shareable: true,
        template_id: "template_id",
        gave_consent: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_create_throws_unauthorized_error_with_wiremock
    test_id = "identity.verification.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.identity.verification.create(
        is_shareable: true,
        template_id: "template_id",
        gave_consent: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_create_throws_too_many_requests_error_with_wiremock
    test_id = "identity.verification.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.create(
        is_shareable: true,
        template_id: "template_id",
        gave_consent: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_create_throws_internal_server_error_with_wiremock
    test_id = "identity.verification.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.verification.create(
        is_shareable: true,
        template_id: "template_id",
        gave_consent: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_create_throws_client_request_error_with_wiremock
    test_id = "identity.verification.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.create(
        is_shareable: true,
        template_id: "template_id",
        gave_consent: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_create_throws_server_error_with_wiremock
    test_id = "identity.verification.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.verification.create(
        is_shareable: true,
        template_id: "template_id",
        gave_consent: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_get_with_wiremock
    test_id = "identity.verification.get.0"

    result = @client.identity.verification.get(
      identity_verification_id: "idv_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "identity.verification.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/template/version" => 2,
        "/documentary_verification/documents/0/attempt" => 1,
        "/selfie_check/selfies/0/attempt" => 1,
        "/selfie_check/selfies/0/analysis/age_check/reported_age" => 36,
        "/selfie_check/selfies/0/analysis/age_check/age_estimate_lower_bound" => 32,
        "/selfie_check/selfies/0/analysis/age_check/age_estimate_upper_bound" => 38,
        "/risk_check/email/breach_count" => 1,
        "/risk_check/devices/0/ip_spam_list_count" => 1,
        "/risk_check/identity_abuse_signals/synthetic_identity/score" => 0,
        "/risk_check/identity_abuse_signals/stolen_identity/score" => 0,
        "/risk_check/facial_duplicates/0/similarity" => 95,
        "/risk_check/trust_index_score" => 86,
        "/verify_sms/verifications/0/attempt" => 1,
        "/verify_sms/verifications/0/delivery_attempt_count" => 1,
        "/verify_sms/verifications/0/solve_attempt_count" => 1,
        "/latest_scored_protect_event/trust_index/score" => 86,
        "/latest_scored_protect_event/trust_index/subscores/device_and_connection/score" => 87,
        "/latest_scored_protect_event/trust_index/subscores/bank_account_insights/score" => 85,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/link_session.linked_bank_accounts.connected_apps.days_since_first_connection" => 582,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.bank_accounts.num_of_frozen_or_restricted_accounts" => 0,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.linked_bank_accounts.num_family_names" => 1,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.linked_bank_accounts.num_of_connected_banks" => 1,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.link_sessions.days_since_first_link_session" => 150,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.pi.email.history_yrs" => 7.03,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.pi.email.num_social_networks_linked" => 12
      }
    )
  end

  def test_identity_verification_get_throws_bad_request_error_with_wiremock
    test_id = "identity.verification.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.get(
        identity_verification_id: "identity_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_get_throws_unauthorized_error_with_wiremock
    test_id = "identity.verification.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.identity.verification.get(
        identity_verification_id: "identity_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_get_throws_too_many_requests_error_with_wiremock
    test_id = "identity.verification.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.get(
        identity_verification_id: "identity_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_get_throws_internal_server_error_with_wiremock
    test_id = "identity.verification.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.verification.get(
        identity_verification_id: "identity_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_get_throws_client_request_error_with_wiremock
    test_id = "identity.verification.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.get(
        identity_verification_id: "identity_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_get_throws_server_error_with_wiremock
    test_id = "identity.verification.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.verification.get(
        identity_verification_id: "identity_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_list_with_wiremock
    test_id = "identity.verification.list.0"

    result = @client.identity.verification.list(
      template_id: "idvtmp_4FrXJvfQU3zGUR",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "identity.verification.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_list_throws_bad_request_error_with_wiremock
    test_id = "identity.verification.list.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.list(
        template_id: "template_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.list.1"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_list_throws_unauthorized_error_with_wiremock
    test_id = "identity.verification.list.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.identity.verification.list(
        template_id: "template_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.list.2"
          }
        }
      ).pages.next_page
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_list_throws_too_many_requests_error_with_wiremock
    test_id = "identity.verification.list.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.list(
        template_id: "template_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.list.3"
          }
        }
      ).pages.next_page
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_list_throws_internal_server_error_with_wiremock
    test_id = "identity.verification.list.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.verification.list(
        template_id: "template_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.list.4"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_list_throws_client_request_error_with_wiremock
    test_id = "identity.verification.list.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.list(
        template_id: "template_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.list.5"
          }
        }
      ).pages.next_page
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_list_throws_server_error_with_wiremock
    test_id = "identity.verification.list.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.verification.list(
        template_id: "template_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.list.6"
          }
        }
      ).pages.next_page
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_retry__with_wiremock
    test_id = "identity.verification.retry_.0"

    result = @client.identity.verification.retry_(
      client_user_id: "your-db-id-3b24110",
      template_id: "idvtmp_4FrXJvfQU3zGUR",
      strategy: "reset",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "identity.verification.retry_.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/retry",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/template/version" => 2,
        "/documentary_verification/documents/0/attempt" => 1,
        "/selfie_check/selfies/0/attempt" => 1,
        "/selfie_check/selfies/0/analysis/age_check/reported_age" => 36,
        "/selfie_check/selfies/0/analysis/age_check/age_estimate_lower_bound" => 32,
        "/selfie_check/selfies/0/analysis/age_check/age_estimate_upper_bound" => 38,
        "/risk_check/email/breach_count" => 1,
        "/risk_check/devices/0/ip_spam_list_count" => 1,
        "/risk_check/identity_abuse_signals/synthetic_identity/score" => 0,
        "/risk_check/identity_abuse_signals/stolen_identity/score" => 0,
        "/risk_check/facial_duplicates/0/similarity" => 95,
        "/risk_check/trust_index_score" => 86,
        "/verify_sms/verifications/0/attempt" => 1,
        "/verify_sms/verifications/0/delivery_attempt_count" => 1,
        "/verify_sms/verifications/0/solve_attempt_count" => 1,
        "/latest_scored_protect_event/trust_index/score" => 86,
        "/latest_scored_protect_event/trust_index/subscores/device_and_connection/score" => 87,
        "/latest_scored_protect_event/trust_index/subscores/bank_account_insights/score" => 85,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/link_session.linked_bank_accounts.connected_apps.days_since_first_connection" => 582,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.bank_accounts.num_of_frozen_or_restricted_accounts" => 0,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.linked_bank_accounts.num_family_names" => 1,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.linked_bank_accounts.num_of_connected_banks" => 1,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.link_sessions.days_since_first_link_session" => 150,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.pi.email.history_yrs" => 7.03,
        "/latest_scored_protect_event/fraud_attributes/fraud_attributes/user.pi.email.num_social_networks_linked" => 12
      }
    )
  end

  def test_identity_verification_retry__throws_bad_request_error_with_wiremock
    test_id = "identity.verification.retry_.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.retry_(
        client_user_id: "client_user_id",
        template_id: "template_id",
        strategy: "reset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.retry_.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/retry",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_retry__throws_unauthorized_error_with_wiremock
    test_id = "identity.verification.retry_.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.identity.verification.retry_(
        client_user_id: "client_user_id",
        template_id: "template_id",
        strategy: "reset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.retry_.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/retry",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_retry__throws_too_many_requests_error_with_wiremock
    test_id = "identity.verification.retry_.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.retry_(
        client_user_id: "client_user_id",
        template_id: "template_id",
        strategy: "reset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.retry_.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/retry",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_retry__throws_internal_server_error_with_wiremock
    test_id = "identity.verification.retry_.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.verification.retry_(
        client_user_id: "client_user_id",
        template_id: "template_id",
        strategy: "reset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.retry_.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/retry",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_retry__throws_client_request_error_with_wiremock
    test_id = "identity.verification.retry_.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.retry_(
        client_user_id: "client_user_id",
        template_id: "template_id",
        strategy: "reset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.retry_.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/retry",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_retry__throws_server_error_with_wiremock
    test_id = "identity.verification.retry_.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.verification.retry_(
        client_user_id: "client_user_id",
        template_id: "template_id",
        strategy: "reset",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.retry_.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/retry",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_create_autofill_with_wiremock
    test_id = "identity.verification.create_autofill.0"

    @client.identity.verification.create_autofill(
      identity_verification_id: "flwses_42cF1MNo42r9Xj",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "identity.verification.create_autofill.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/autofill/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_create_autofill_throws_bad_request_error_with_wiremock
    test_id = "identity.verification.create_autofill.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.create_autofill(
        identity_verification_id: "identity_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.create_autofill.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/autofill/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_create_autofill_throws_unauthorized_error_with_wiremock
    test_id = "identity.verification.create_autofill.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.identity.verification.create_autofill(
        identity_verification_id: "identity_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.create_autofill.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/autofill/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_create_autofill_throws_too_many_requests_error_with_wiremock
    test_id = "identity.verification.create_autofill.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.create_autofill(
        identity_verification_id: "identity_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.create_autofill.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/autofill/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_create_autofill_throws_internal_server_error_with_wiremock
    test_id = "identity.verification.create_autofill.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.verification.create_autofill(
        identity_verification_id: "identity_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.create_autofill.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/autofill/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_create_autofill_throws_client_request_error_with_wiremock
    test_id = "identity.verification.create_autofill.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.identity.verification.create_autofill(
        identity_verification_id: "identity_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.create_autofill.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/autofill/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_identity_verification_create_autofill_throws_server_error_with_wiremock
    test_id = "identity.verification.create_autofill.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.identity.verification.create_autofill(
        identity_verification_id: "identity_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "identity.verification.create_autofill.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/identity_verification/autofill/create",
      query_params: nil,
      expected: 1
    )
  end
end
