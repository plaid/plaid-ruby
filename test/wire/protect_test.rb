# frozen_string_literal: true

require_relative "wiremock_test_case"

class ProtectWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_protect_get_user_insights_with_wiremock
    test_id = "protect.get_user_insights.0"

    result = @client.protect.get_user_insights(request_options: {
      additional_headers: {
        "X-Test-Id" => "protect.get_user_insights.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/user/insights/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/latest_scored_event/trust_index/score" => 86,
        "/latest_scored_event/trust_index/subscores/device_and_connection/score" => 87,
        "/latest_scored_event/trust_index/subscores/bank_account_insights/score" => 85,
        "/latest_scored_event/fraud_attributes/link_session.linked_bank_accounts.connected_apps.days_since_first_connection" => 582,
        "/latest_scored_event/fraud_attributes/user.bank_accounts.num_of_frozen_or_restricted_accounts" => 0,
        "/latest_scored_event/fraud_attributes/user.linked_bank_accounts.num_family_names" => 1,
        "/latest_scored_event/fraud_attributes/user.linked_bank_accounts.num_of_connected_banks" => 1,
        "/latest_scored_event/fraud_attributes/user.link_sessions.days_since_first_link_session" => 150,
        "/latest_scored_event/fraud_attributes/user.pi.email.history_yrs" => 7.03,
        "/latest_scored_event/fraud_attributes/user.pi.email.num_social_networks_linked" => 12
      }
    )
  end

  def test_protect_get_user_insights_throws_bad_request_error_with_wiremock
    test_id = "protect.get_user_insights.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.get_user_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.get_user_insights.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/user/insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_get_user_insights_throws_unauthorized_error_with_wiremock
    test_id = "protect.get_user_insights.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.protect.get_user_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.get_user_insights.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/user/insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_get_user_insights_throws_too_many_requests_error_with_wiremock
    test_id = "protect.get_user_insights.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.get_user_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.get_user_insights.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/user/insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_get_user_insights_throws_internal_server_error_with_wiremock
    test_id = "protect.get_user_insights.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.get_user_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.get_user_insights.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/user/insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_get_user_insights_throws_client_request_error_with_wiremock
    test_id = "protect.get_user_insights.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.get_user_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.get_user_insights.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/user/insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_get_user_insights_throws_server_error_with_wiremock
    test_id = "protect.get_user_insights.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.get_user_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.get_user_insights.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/user/insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_report_with_wiremock
    test_id = "protect.create_report.0"

    @client.protect.create_report(
      report_confidence: "CONFIRMED",
      report_type: "USER_ACCOUNT_TAKEOVER",
      report_source: "INTERNAL_REVIEW",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.create_report.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_report_throws_bad_request_error_with_wiremock
    test_id = "protect.create_report.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.create_report(
        report_confidence: "CONFIRMED",
        report_type: "USER_ACCOUNT_TAKEOVER",
        report_source: "INTERNAL_REVIEW",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_report.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_report_throws_unauthorized_error_with_wiremock
    test_id = "protect.create_report.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.protect.create_report(
        report_confidence: "CONFIRMED",
        report_type: "USER_ACCOUNT_TAKEOVER",
        report_source: "INTERNAL_REVIEW",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_report.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_report_throws_too_many_requests_error_with_wiremock
    test_id = "protect.create_report.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.create_report(
        report_confidence: "CONFIRMED",
        report_type: "USER_ACCOUNT_TAKEOVER",
        report_source: "INTERNAL_REVIEW",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_report.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_report_throws_internal_server_error_with_wiremock
    test_id = "protect.create_report.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.create_report(
        report_confidence: "CONFIRMED",
        report_type: "USER_ACCOUNT_TAKEOVER",
        report_source: "INTERNAL_REVIEW",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_report.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_report_throws_client_request_error_with_wiremock
    test_id = "protect.create_report.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.create_report(
        report_confidence: "CONFIRMED",
        report_type: "USER_ACCOUNT_TAKEOVER",
        report_source: "INTERNAL_REVIEW",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_report.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_report_throws_server_error_with_wiremock
    test_id = "protect.create_report.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.create_report(
        report_confidence: "CONFIRMED",
        report_type: "USER_ACCOUNT_TAKEOVER",
        report_source: "INTERNAL_REVIEW",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_report.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/report/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_cash_advance_decision_with_wiremock
    test_id = "protect.create_cash_advance_decision.0"

    @client.protect.create_cash_advance_decision(
      user: {},
      decision_time: "2024-01-15T09:30:00Z",
      decision: "APPROVED",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.create_cash_advance_decision.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/decision/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_cash_advance_decision_throws_bad_request_error_with_wiremock
    test_id = "protect.create_cash_advance_decision.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.create_cash_advance_decision(
        user: {},
        decision_time: "2024-01-15T09:30:00Z",
        decision: "APPROVED",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_cash_advance_decision.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/decision/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_cash_advance_decision_throws_unauthorized_error_with_wiremock
    test_id = "protect.create_cash_advance_decision.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.protect.create_cash_advance_decision(
        user: {},
        decision_time: "2024-01-15T09:30:00Z",
        decision: "APPROVED",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_cash_advance_decision.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/decision/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_cash_advance_decision_throws_too_many_requests_error_with_wiremock
    test_id = "protect.create_cash_advance_decision.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.create_cash_advance_decision(
        user: {},
        decision_time: "2024-01-15T09:30:00Z",
        decision: "APPROVED",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_cash_advance_decision.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/decision/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_cash_advance_decision_throws_internal_server_error_with_wiremock
    test_id = "protect.create_cash_advance_decision.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.create_cash_advance_decision(
        user: {},
        decision_time: "2024-01-15T09:30:00Z",
        decision: "APPROVED",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_cash_advance_decision.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/decision/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_cash_advance_decision_throws_client_request_error_with_wiremock
    test_id = "protect.create_cash_advance_decision.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.create_cash_advance_decision(
        user: {},
        decision_time: "2024-01-15T09:30:00Z",
        decision: "APPROVED",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_cash_advance_decision.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/decision/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_cash_advance_decision_throws_server_error_with_wiremock
    test_id = "protect.create_cash_advance_decision.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.create_cash_advance_decision(
        user: {},
        decision_time: "2024-01-15T09:30:00Z",
        decision: "APPROVED",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_cash_advance_decision.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/decision/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_create_cash_advance_repayment_with_wiremock
    test_id = "protect.create_cash_advance_repayment.0"

    @client.protect.create_cash_advance_repayment(
      user: {},
      client_advance_id: "client_advance_id",
      status: "REPAID",
      repayment: {
        amount_due: {
          value: 1.1
        },
        due_date: "2023-01-15"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.create_cash_advance_repayment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      expected: {
        "/repayment/amount_due/value" => 1.1
      }
    )
  end

  def test_protect_create_cash_advance_repayment_throws_bad_request_error_with_wiremock
    test_id = "protect.create_cash_advance_repayment.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.create_cash_advance_repayment(
        user: {},
        client_advance_id: "client_advance_id",
        status: "REPAID",
        repayment: {
          amount_due: {
            value: 1.1
          },
          due_date: "2023-01-15"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_cash_advance_repayment.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      expected: {
        "/repayment/amount_due/value" => 1.1
      }
    )
  end

  def test_protect_create_cash_advance_repayment_throws_unauthorized_error_with_wiremock
    test_id = "protect.create_cash_advance_repayment.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.protect.create_cash_advance_repayment(
        user: {},
        client_advance_id: "client_advance_id",
        status: "REPAID",
        repayment: {
          amount_due: {
            value: 1.1
          },
          due_date: "2023-01-15"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_cash_advance_repayment.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      expected: {
        "/repayment/amount_due/value" => 1.1
      }
    )
  end

  def test_protect_create_cash_advance_repayment_throws_too_many_requests_error_with_wiremock
    test_id = "protect.create_cash_advance_repayment.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.create_cash_advance_repayment(
        user: {},
        client_advance_id: "client_advance_id",
        status: "REPAID",
        repayment: {
          amount_due: {
            value: 1.1
          },
          due_date: "2023-01-15"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_cash_advance_repayment.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      expected: {
        "/repayment/amount_due/value" => 1.1
      }
    )
  end

  def test_protect_create_cash_advance_repayment_throws_internal_server_error_with_wiremock
    test_id = "protect.create_cash_advance_repayment.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.create_cash_advance_repayment(
        user: {},
        client_advance_id: "client_advance_id",
        status: "REPAID",
        repayment: {
          amount_due: {
            value: 1.1
          },
          due_date: "2023-01-15"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_cash_advance_repayment.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      expected: {
        "/repayment/amount_due/value" => 1.1
      }
    )
  end

  def test_protect_create_cash_advance_repayment_throws_client_request_error_with_wiremock
    test_id = "protect.create_cash_advance_repayment.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.create_cash_advance_repayment(
        user: {},
        client_advance_id: "client_advance_id",
        status: "REPAID",
        repayment: {
          amount_due: {
            value: 1.1
          },
          due_date: "2023-01-15"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_cash_advance_repayment.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      expected: {
        "/repayment/amount_due/value" => 1.1
      }
    )
  end

  def test_protect_create_cash_advance_repayment_throws_server_error_with_wiremock
    test_id = "protect.create_cash_advance_repayment.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.create_cash_advance_repayment(
        user: {},
        client_advance_id: "client_advance_id",
        status: "REPAID",
        repayment: {
          amount_due: {
            value: 1.1
          },
          due_date: "2023-01-15"
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.create_cash_advance_repayment.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/repayment/create",
      expected: {
        "/repayment/amount_due/value" => 1.1
      }
    )
  end

  def test_protect_upload_cash_advance_feedback_with_wiremock
    test_id = "protect.upload_cash_advance_feedback.0"

    @client.protect.upload_cash_advance_feedback(
      feedback_type: "DECISION",
      file: "file",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.upload_cash_advance_feedback.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/feedback/upload",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_upload_cash_advance_feedback_throws_bad_request_error_with_wiremock
    test_id = "protect.upload_cash_advance_feedback.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.upload_cash_advance_feedback(
        feedback_type: "DECISION",
        file: "file",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.upload_cash_advance_feedback.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/feedback/upload",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_upload_cash_advance_feedback_throws_unauthorized_error_with_wiremock
    test_id = "protect.upload_cash_advance_feedback.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.protect.upload_cash_advance_feedback(
        feedback_type: "DECISION",
        file: "file",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.upload_cash_advance_feedback.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/feedback/upload",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_upload_cash_advance_feedback_throws_too_many_requests_error_with_wiremock
    test_id = "protect.upload_cash_advance_feedback.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.upload_cash_advance_feedback(
        feedback_type: "DECISION",
        file: "file",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.upload_cash_advance_feedback.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/feedback/upload",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_upload_cash_advance_feedback_throws_internal_server_error_with_wiremock
    test_id = "protect.upload_cash_advance_feedback.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.upload_cash_advance_feedback(
        feedback_type: "DECISION",
        file: "file",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.upload_cash_advance_feedback.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/feedback/upload",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_upload_cash_advance_feedback_throws_client_request_error_with_wiremock
    test_id = "protect.upload_cash_advance_feedback.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.upload_cash_advance_feedback(
        feedback_type: "DECISION",
        file: "file",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.upload_cash_advance_feedback.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/feedback/upload",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_upload_cash_advance_feedback_throws_server_error_with_wiremock
    test_id = "protect.upload_cash_advance_feedback.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.upload_cash_advance_feedback(
        feedback_type: "DECISION",
        file: "file",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.upload_cash_advance_feedback.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/cash_advance/feedback/upload",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_compute_with_wiremock
    test_id = "protect.compute.0"

    result = @client.protect.compute(
      model: "model",
      user: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.compute.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/compute",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/score" => 86,
        "/attributes/link_session.linked_bank_accounts.connected_apps.days_since_first_connection" => 582,
        "/attributes/user.bank_accounts.num_of_frozen_or_restricted_accounts" => 0,
        "/attributes/user.linked_bank_accounts.num_family_names" => 1,
        "/attributes/user.linked_bank_accounts.num_of_connected_banks" => 1,
        "/attributes/user.link_sessions.days_since_first_link_session" => 150,
        "/attributes/user.pi.email.history_yrs" => 7.03,
        "/attributes/user.pi.email.num_social_networks_linked" => 12,
        "/subscores/cash_advance_bucket_0_25" => 1,
        "/subscores/cash_advance_bucket_25_50" => 1,
        "/subscores/cash_advance_bucket_50_100" => 1,
        "/subscores/cash_advance_bucket_100_200" => 1,
        "/subscores/cash_advance_bucket_200_300" => 1,
        "/subscores/cash_advance_bucket_300_400" => 1,
        "/subscores/cash_advance_bucket_400_500" => 1
      }
    )
  end

  def test_protect_compute_throws_bad_request_error_with_wiremock
    test_id = "protect.compute.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.compute(
        model: "model",
        user: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.compute.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/compute",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_compute_throws_unauthorized_error_with_wiremock
    test_id = "protect.compute.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.protect.compute(
        model: "model",
        user: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.compute.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/compute",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_compute_throws_too_many_requests_error_with_wiremock
    test_id = "protect.compute.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.compute(
        model: "model",
        user: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.compute.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/compute",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_compute_throws_internal_server_error_with_wiremock
    test_id = "protect.compute.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.compute(
        model: "model",
        user: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.compute.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/compute",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_compute_throws_client_request_error_with_wiremock
    test_id = "protect.compute.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.compute(
        model: "model",
        user: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.compute.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/compute",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_compute_throws_server_error_with_wiremock
    test_id = "protect.compute.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.compute(
        model: "model",
        user: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.compute.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/compute",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_send_event_with_wiremock
    test_id = "protect.send_event.0"

    result = @client.protect.send_event(
      event: nil,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.send_event.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/send",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/trust_index/score" => 86,
        "/trust_index/subscores/device_and_connection/score" => 87,
        "/trust_index/subscores/bank_account_insights/score" => 85,
        "/fraud_attributes/link_session.linked_bank_accounts.connected_apps.days_since_first_connection" => 582,
        "/fraud_attributes/user.bank_accounts.num_of_frozen_or_restricted_accounts" => 0,
        "/fraud_attributes/user.linked_bank_accounts.num_family_names" => 1,
        "/fraud_attributes/user.linked_bank_accounts.num_of_connected_banks" => 1,
        "/fraud_attributes/user.link_sessions.days_since_first_link_session" => 150,
        "/fraud_attributes/user.pi.email.history_yrs" => 7.03,
        "/fraud_attributes/user.pi.email.num_social_networks_linked" => 12
      }
    )
  end

  def test_protect_send_event_throws_bad_request_error_with_wiremock
    test_id = "protect.send_event.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.send_event(
        event: nil,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.send_event.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_send_event_throws_unauthorized_error_with_wiremock
    test_id = "protect.send_event.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.protect.send_event(
        event: nil,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.send_event.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_send_event_throws_too_many_requests_error_with_wiremock
    test_id = "protect.send_event.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.send_event(
        event: nil,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.send_event.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_send_event_throws_internal_server_error_with_wiremock
    test_id = "protect.send_event.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.send_event(
        event: nil,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.send_event.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_send_event_throws_client_request_error_with_wiremock
    test_id = "protect.send_event.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.send_event(
        event: nil,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.send_event.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_send_event_throws_server_error_with_wiremock
    test_id = "protect.send_event.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.send_event(
        event: nil,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.send_event.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/send",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_get_event_with_wiremock
    test_id = "protect.get_event.0"

    result = @client.protect.get_event(
      event_id: "event_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "protect.get_event.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/trust_index/score" => 86,
        "/trust_index/subscores/device_and_connection/score" => 87,
        "/trust_index/subscores/bank_account_insights/score" => 85,
        "/fraud_attributes/link_session.linked_bank_accounts.connected_apps.days_since_first_connection" => 582,
        "/fraud_attributes/user.bank_accounts.num_of_frozen_or_restricted_accounts" => 0,
        "/fraud_attributes/user.linked_bank_accounts.num_family_names" => 1,
        "/fraud_attributes/user.linked_bank_accounts.num_of_connected_banks" => 1,
        "/fraud_attributes/user.link_sessions.days_since_first_link_session" => 150,
        "/fraud_attributes/user.pi.email.history_yrs" => 7.03,
        "/fraud_attributes/user.pi.email.num_social_networks_linked" => 12
      }
    )
  end

  def test_protect_get_event_throws_bad_request_error_with_wiremock
    test_id = "protect.get_event.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.get_event(
        event_id: "event_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.get_event.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_get_event_throws_unauthorized_error_with_wiremock
    test_id = "protect.get_event.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.protect.get_event(
        event_id: "event_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.get_event.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_get_event_throws_too_many_requests_error_with_wiremock
    test_id = "protect.get_event.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.get_event(
        event_id: "event_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.get_event.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_get_event_throws_internal_server_error_with_wiremock
    test_id = "protect.get_event.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.get_event(
        event_id: "event_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.get_event.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_get_event_throws_client_request_error_with_wiremock
    test_id = "protect.get_event.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.protect.get_event(
        event_id: "event_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.get_event.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_protect_get_event_throws_server_error_with_wiremock
    test_id = "protect.get_event.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.protect.get_event(
        event_id: "event_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "protect.get_event.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/protect/event/get",
      query_params: nil,
      expected: 1
    )
  end
end
