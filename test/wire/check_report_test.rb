# frozen_string_literal: true

require_relative "wiremock_test_case"

class CheckReportWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_check_report_get_income_insights_with_wiremock
    test_id = "check_report.get_income_insights.0"

    result = @client.check_report.get_income_insights(request_options: {
      additional_headers: {
        "X-Test-Id" => "check_report.get_income_insights.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/income_insights/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/report/days_requested" => 365,
        "/report/user_summary/income_metrics/0/current/monthly/gross_income" => 390,
        "/report/user_summary/income_metrics/0/current/monthly/net_income" => 300,
        "/report/user_summary/income_metrics/0/current/annual/gross_income" => 4680,
        "/report/user_summary/income_metrics/0/current/annual/net_income" => 3600,
        "/report/user_summary/income_metrics/0/projected/monthly/gross_income" => 300,
        "/report/user_summary/income_metrics/0/projected/monthly/net_income" => 300,
        "/report/user_summary/income_metrics/0/projected/annual/gross_income" => 3600,
        "/report/user_summary/income_metrics/0/projected/annual/net_income" => 3600,
        "/report/income_streams/0/income_metrics/current/monthly/gross_income" => 390,
        "/report/income_streams/0/income_metrics/current/monthly/net_income" => 300,
        "/report/income_streams/0/income_metrics/current/annual/gross_income" => 4680,
        "/report/income_streams/0/income_metrics/current/annual/net_income" => 3600,
        "/report/income_streams/0/income_metrics/projected/monthly/gross_income" => 300,
        "/report/income_streams/0/income_metrics/projected/monthly/net_income" => 300,
        "/report/income_streams/0/income_metrics/projected/annual/gross_income" => 3600,
        "/report/income_streams/0/income_metrics/projected/annual/net_income" => 3600,
        "/report/income_streams/0/transactions/0/amount" => 100,
        "/report/income_streams/0/transactions/1/amount" => 100,
        "/report/income_streams/0/transactions/2/amount" => 100,
        "/report/bank_income_summary/total_amounts/0/amount" => 1.1,
        "/report/bank_income_summary/income_sources_count" => 1,
        "/report/bank_income_summary/income_categories_count" => 1,
        "/report/bank_income_summary/income_transactions_count" => 1,
        "/report/bank_income_summary/historical_average_monthly_gross_income/0/amount" => 1.1,
        "/report/bank_income_summary/historical_average_monthly_income/0/amount" => 1.1,
        "/report/bank_income_summary/forecasted_average_monthly_income/0/amount" => 1.1,
        "/report/bank_income_summary/historical_annual_gross_income/0/amount" => 1.1,
        "/report/bank_income_summary/historical_annual_income/0/amount" => 1.1,
        "/report/bank_income_summary/forecasted_annual_income/0/amount" => 1.1
      }
    )
  end

  def test_check_report_get_income_insights_throws_bad_request_error_with_wiremock
    test_id = "check_report.get_income_insights.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_income_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_income_insights.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/income_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_income_insights_throws_unauthorized_error_with_wiremock
    test_id = "check_report.get_income_insights.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.check_report.get_income_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_income_insights.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/income_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_income_insights_throws_too_many_requests_error_with_wiremock
    test_id = "check_report.get_income_insights.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_income_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_income_insights.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/income_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_income_insights_throws_internal_server_error_with_wiremock
    test_id = "check_report.get_income_insights.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_income_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_income_insights.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/income_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_income_insights_throws_client_request_error_with_wiremock
    test_id = "check_report.get_income_insights.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_income_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_income_insights.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/income_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_income_insights_throws_server_error_with_wiremock
    test_id = "check_report.get_income_insights.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_income_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_income_insights.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/income_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_base_report_with_wiremock
    test_id = "check_report.get_base_report.0"

    result = @client.check_report.get_base_report(request_options: {
      additional_headers: {
        "X-Test-Id" => "check_report.get_base_report.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/base_report/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/report/days_requested" => 365,
        "/report/items/0/accounts/0/balances/available" => 5000,
        "/report/items/0/accounts/0/balances/current" => 5000,
        "/report/items/0/accounts/0/balances/average_balance" => 4956.12,
        "/report/items/0/accounts/0/balances/average_monthly_balances/0/average_balance/amount" => 4956.12,
        "/report/items/0/accounts/0/balances/most_recent_thirty_day_average_balance" => 4956.125,
        "/report/items/0/accounts/0/days_available" => 365,
        "/report/items/0/accounts/0/transactions/0/amount" => 37.07,
        "/report/items/0/accounts/0/transactions/1/amount" => 51.61,
        "/report/items/0/accounts/0/transactions/2/amount" => 7.55,
        "/report/items/0/accounts/0/transactions/3/amount" => 12.87,
        "/report/items/0/accounts/0/transactions/4/amount" => 44.21,
        "/report/items/0/accounts/0/transactions/5/amount" => 36.82,
        "/report/items/0/accounts/0/transactions/6/amount" => 13.27,
        "/report/items/0/accounts/0/transactions/7/amount" => 36.03,
        "/report/items/0/accounts/0/transactions/8/amount" => 54.74,
        "/report/items/0/accounts/0/transactions/9/amount" => 37.5,
        "/report/items/0/accounts/0/transactions/10/amount" => 41.42,
        "/report/items/0/accounts/0/transactions/11/amount" => -1077.93,
        "/report/items/0/accounts/0/transactions/12/amount" => 47.17,
        "/report/items/0/accounts/0/transactions/13/amount" => 12.37,
        "/report/items/0/accounts/0/transactions/14/amount" => 44.18,
        "/report/items/0/accounts/0/transactions/15/amount" => 45.37,
        "/report/items/0/accounts/0/transactions/16/amount" => 15.22,
        "/report/items/0/accounts/0/transactions/17/amount" => 26.33,
        "/report/items/0/accounts/0/transactions/18/amount" => 39.8,
        "/report/items/0/accounts/0/transactions/19/amount" => 45.06,
        "/report/items/0/accounts/0/transactions/20/amount" => 34.91,
        "/report/items/0/accounts/0/transactions/21/amount" => 49.78,
        "/report/items/0/accounts/0/transactions/22/amount" => 54.24,
        "/report/items/0/accounts/0/transactions/23/amount" => 41.79,
        "/report/items/0/accounts/0/transactions/24/amount" => 33.86,
        "/report/items/0/accounts/0/transactions/25/amount" => 27.08,
        "/report/items/0/accounts/0/transactions/26/amount" => 25.94,
        "/report/items/0/accounts/0/transactions/27/amount" => 27.57,
        "/report/items/0/accounts/0/account_insights/days_available" => 365,
        "/report/items/0/accounts/0/account_insights/average_days_between_transactions" => 0.15,
        "/report/items/0/accounts/0/account_insights/longest_gaps_between_transactions/0/days" => 1,
        "/report/items/0/accounts/0/account_insights/longest_gaps_between_transactions/1/days" => 2,
        "/report/items/0/accounts/0/account_insights/number_of_inflows/0/count" => 1,
        "/report/items/0/accounts/0/account_insights/average_inflow_amounts/0/total_amount/amount" => 1077.93,
        "/report/items/0/accounts/0/account_insights/average_inflow_amounts/1/total_amount/amount" => 1076.93,
        "/report/items/0/accounts/0/account_insights/number_of_outflows/0/count" => 27,
        "/report/items/0/accounts/0/account_insights/average_outflow_amounts/0/total_amount/amount" => 34.95,
        "/report/items/0/accounts/0/account_insights/average_outflow_amounts/1/total_amount/amount" => 0,
        "/report/items/0/accounts/0/account_insights/number_of_days_no_transactions" => 0,
        "/report/items/0/accounts/0/account_insights/average_inflow_amount/0/total_amount/amount" => 1077.93,
        "/report/items/0/accounts/0/account_insights/average_outflow_amount/0/total_amount/amount" => 34.95,
        "/report/items/0/accounts/0/account_insights/longest_gap_between_transactions/0/days" => 1,
        "/report/attributes/nsf_overdraft_transactions_count" => 1,
        "/report/attributes/nsf_overdraft_transactions_count_30d" => 1,
        "/report/attributes/nsf_overdraft_transactions_count_60d" => 1,
        "/report/attributes/nsf_overdraft_transactions_count_90d" => 1,
        "/report/attributes/total_inflow_amount/amount" => -2500,
        "/report/attributes/total_inflow_amount_30d/amount" => -1000,
        "/report/attributes/total_inflow_amount_60d/amount" => -2500,
        "/report/attributes/total_inflow_amount_90d/amount" => -2500,
        "/report/attributes/total_outflow_amount/amount" => 2500,
        "/report/attributes/total_outflow_amount_30d/amount" => 1000,
        "/report/attributes/total_outflow_amount_60d/amount" => 2500,
        "/report/attributes/total_outflow_amount_90d/amount" => 2500
      }
    )
  end

  def test_check_report_get_base_report_throws_bad_request_error_with_wiremock
    test_id = "check_report.get_base_report.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_base_report(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_base_report.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/base_report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_base_report_throws_unauthorized_error_with_wiremock
    test_id = "check_report.get_base_report.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.check_report.get_base_report(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_base_report.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/base_report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_base_report_throws_too_many_requests_error_with_wiremock
    test_id = "check_report.get_base_report.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_base_report(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_base_report.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/base_report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_base_report_throws_internal_server_error_with_wiremock
    test_id = "check_report.get_base_report.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_base_report(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_base_report.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/base_report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_base_report_throws_client_request_error_with_wiremock
    test_id = "check_report.get_base_report.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_base_report(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_base_report.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/base_report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_base_report_throws_server_error_with_wiremock
    test_id = "check_report.get_base_report.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_base_report(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_base_report.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/base_report/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_pdf_with_wiremock
    test_id = "check_report.get_pdf.0"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_pdf.0"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_pdf_throws_unauthorized_error_with_wiremock
    test_id = "check_report.get_pdf.1"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.check_report.get_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_pdf.1"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_pdf_throws_too_many_requests_error_with_wiremock
    test_id = "check_report.get_pdf.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_pdf.2"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_pdf_throws_internal_server_error_with_wiremock
    test_id = "check_report.get_pdf.3"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_pdf.3"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_pdf_throws_client_request_error_with_wiremock
    test_id = "check_report.get_pdf.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_pdf.4"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_pdf_throws_server_error_with_wiremock
    test_id = "check_report.get_pdf.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_pdf.5"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_create_with_wiremock
    test_id = "check_report.create.0"

    @client.check_report.create(
      webhook: "webhook",
      days_requested: 1,
      consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      expected: {
        "/days_requested" => 1
      }
    )
  end

  def test_check_report_create_throws_bad_request_error_with_wiremock
    test_id = "check_report.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.create(
        webhook: "webhook",
        days_requested: 731,
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "check_report.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      expected: {
        "/days_requested" => 731
      }
    )
  end

  def test_check_report_create_throws_unauthorized_error_with_wiremock
    test_id = "check_report.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.check_report.create(
        webhook: "webhook",
        days_requested: 731,
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "check_report.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      expected: {
        "/days_requested" => 731
      }
    )
  end

  def test_check_report_create_throws_too_many_requests_error_with_wiremock
    test_id = "check_report.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.create(
        webhook: "webhook",
        days_requested: 731,
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "check_report.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      expected: {
        "/days_requested" => 731
      }
    )
  end

  def test_check_report_create_throws_internal_server_error_with_wiremock
    test_id = "check_report.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.create(
        webhook: "webhook",
        days_requested: 731,
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "check_report.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      expected: {
        "/days_requested" => 731
      }
    )
  end

  def test_check_report_create_throws_client_request_error_with_wiremock
    test_id = "check_report.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.create(
        webhook: "webhook",
        days_requested: 731,
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "check_report.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      expected: {
        "/days_requested" => 731
      }
    )
  end

  def test_check_report_create_throws_server_error_with_wiremock
    test_id = "check_report.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.create(
        webhook: "webhook",
        days_requested: 731,
        consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "check_report.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/create",
      expected: {
        "/days_requested" => 731
      }
    )
  end

  def test_check_report_get_partner_insights_with_wiremock
    test_id = "check_report.get_partner_insights.0"

    result = @client.check_report.get_partner_insights(request_options: {
      additional_headers: {
        "X-Test-Id" => "check_report.get_partner_insights.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/partner_insights/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/report/prism/insights/version" => 3,
        "/report/prism/insights/result/l6m_cumbal_acc" => 1,
        "/report/prism/cash_score/version" => 3,
        "/report/prism/cash_score/score" => 900,
        "/report/prism/cash_score/metadata/max_age" => 20,
        "/report/prism/cash_score/metadata/min_age" => 1,
        "/report/prism/cash_score/metadata/min_age_credit" => 0,
        "/report/prism/cash_score/metadata/min_age_debit" => 1,
        "/report/prism/cash_score/metadata/max_age_debit" => 20,
        "/report/prism/cash_score/metadata/max_age_credit" => 0,
        "/report/prism/cash_score/metadata/num_trxn_credit" => 0,
        "/report/prism/cash_score/metadata/num_trxn_debit" => 40,
        "/report/prism/cash_score/metadata/l1m_credit_value_cnt" => 0,
        "/report/prism/cash_score/metadata/l1m_debit_value_cnt" => 40,
        "/report/prism/first_detect/version" => 3,
        "/report/prism/first_detect/score" => 900,
        "/report/prism/first_detect/metadata/max_age" => 20,
        "/report/prism/first_detect/metadata/min_age" => 1,
        "/report/prism/first_detect/metadata/min_age_credit" => 0,
        "/report/prism/first_detect/metadata/min_age_debit" => 1,
        "/report/prism/first_detect/metadata/max_age_debit" => 20,
        "/report/prism/first_detect/metadata/max_age_credit" => 0,
        "/report/prism/first_detect/metadata/num_trxn_credit" => 0,
        "/report/prism/first_detect/metadata/num_trxn_debit" => 40,
        "/report/prism/first_detect/metadata/l1m_credit_value_cnt" => 0,
        "/report/prism/first_detect/metadata/l1m_debit_value_cnt" => 40
      }
    )
  end

  def test_check_report_get_partner_insights_throws_bad_request_error_with_wiremock
    test_id = "check_report.get_partner_insights.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_partner_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_partner_insights.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/partner_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_partner_insights_throws_unauthorized_error_with_wiremock
    test_id = "check_report.get_partner_insights.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.check_report.get_partner_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_partner_insights.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/partner_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_partner_insights_throws_too_many_requests_error_with_wiremock
    test_id = "check_report.get_partner_insights.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_partner_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_partner_insights.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/partner_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_partner_insights_throws_internal_server_error_with_wiremock
    test_id = "check_report.get_partner_insights.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_partner_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_partner_insights.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/partner_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_partner_insights_throws_client_request_error_with_wiremock
    test_id = "check_report.get_partner_insights.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_partner_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_partner_insights.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/partner_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_partner_insights_throws_server_error_with_wiremock
    test_id = "check_report.get_partner_insights.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_partner_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_partner_insights.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/partner_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_cashflow_insights_with_wiremock
    test_id = "check_report.get_cashflow_insights.0"

    result = @client.check_report.get_cashflow_insights(request_options: {
      additional_headers: {
        "X-Test-Id" => "check_report.get_cashflow_insights.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/cashflow_insights/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/report/attributes/cash_reliance_atm_withdrawal_amt_cv_90d" => 180.1
      }
    )
  end

  def test_check_report_get_cashflow_insights_throws_bad_request_error_with_wiremock
    test_id = "check_report.get_cashflow_insights.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_cashflow_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_cashflow_insights.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/cashflow_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_cashflow_insights_throws_unauthorized_error_with_wiremock
    test_id = "check_report.get_cashflow_insights.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.check_report.get_cashflow_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_cashflow_insights.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/cashflow_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_cashflow_insights_throws_too_many_requests_error_with_wiremock
    test_id = "check_report.get_cashflow_insights.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_cashflow_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_cashflow_insights.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/cashflow_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_cashflow_insights_throws_internal_server_error_with_wiremock
    test_id = "check_report.get_cashflow_insights.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_cashflow_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_cashflow_insights.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/cashflow_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_cashflow_insights_throws_client_request_error_with_wiremock
    test_id = "check_report.get_cashflow_insights.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_cashflow_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_cashflow_insights.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/cashflow_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_cashflow_insights_throws_server_error_with_wiremock
    test_id = "check_report.get_cashflow_insights.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_cashflow_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_cashflow_insights.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/cashflow_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_lend_score_with_wiremock
    test_id = "check_report.get_lend_score.0"

    result = @client.check_report.get_lend_score(request_options: {
      additional_headers: {
        "X-Test-Id" => "check_report.get_lend_score.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/lend_score/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/report/lend_score/score" => 80
      }
    )
  end

  def test_check_report_get_lend_score_throws_bad_request_error_with_wiremock
    test_id = "check_report.get_lend_score.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_lend_score(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_lend_score.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/lend_score/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_lend_score_throws_unauthorized_error_with_wiremock
    test_id = "check_report.get_lend_score.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.check_report.get_lend_score(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_lend_score.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/lend_score/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_lend_score_throws_too_many_requests_error_with_wiremock
    test_id = "check_report.get_lend_score.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_lend_score(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_lend_score.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/lend_score/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_lend_score_throws_internal_server_error_with_wiremock
    test_id = "check_report.get_lend_score.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_lend_score(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_lend_score.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/lend_score/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_lend_score_throws_client_request_error_with_wiremock
    test_id = "check_report.get_lend_score.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_lend_score(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_lend_score.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/lend_score/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_lend_score_throws_server_error_with_wiremock
    test_id = "check_report.get_lend_score.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_lend_score(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_lend_score.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/lend_score/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_network_insights_with_wiremock
    test_id = "check_report.get_network_insights.0"

    result = @client.check_report.get_network_insights(request_options: {
      additional_headers: {
        "X-Test-Id" => "check_report.get_network_insights.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/network_insights/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/report/network_attributes/plaid_conn_user_lifetime_lending_count" => 5,
        "/report/network_attributes/plaid_conn_user_lifetime_personal_lending_flag" => 1,
        "/report/network_attributes/plaid_conn_user_lifetime_cash_advance_primary_count" => 0
      }
    )
  end

  def test_check_report_get_network_insights_throws_bad_request_error_with_wiremock
    test_id = "check_report.get_network_insights.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_network_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_network_insights.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/network_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_network_insights_throws_unauthorized_error_with_wiremock
    test_id = "check_report.get_network_insights.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.check_report.get_network_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_network_insights.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/network_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_network_insights_throws_too_many_requests_error_with_wiremock
    test_id = "check_report.get_network_insights.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_network_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_network_insights.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/network_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_network_insights_throws_internal_server_error_with_wiremock
    test_id = "check_report.get_network_insights.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_network_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_network_insights.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/network_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_network_insights_throws_client_request_error_with_wiremock
    test_id = "check_report.get_network_insights.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_network_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_network_insights.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/network_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_network_insights_throws_server_error_with_wiremock
    test_id = "check_report.get_network_insights.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_network_insights(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_network_insights.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/network_insights/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_verification_with_wiremock
    test_id = "check_report.get_verification.0"

    result = @client.check_report.get_verification(
      reports_requested: ["VOA"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_verification.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/report/voa/days_requested" => 90,
        "/report/voa/items/0/accounts/0/balances/available" => 100,
        "/report/voa/items/0/accounts/0/balances/current" => 110,
        "/report/voa/items/0/accounts/0/balances/historical_balances/0/current" => 110,
        "/report/voa/items/0/accounts/0/balances/historical_balances/1/current" => 125.55,
        "/report/voa/items/0/accounts/0/balances/historical_balances/2/current" => 80.13,
        "/report/voa/items/0/accounts/0/balances/historical_balances/3/current" => 246.11,
        "/report/voa/items/0/accounts/0/balances/historical_balances/4/current" => 182.71,
        "/report/voa/items/0/accounts/0/balances/average_balance_30_days" => 200,
        "/report/voa/items/0/accounts/0/balances/average_balance_60_days" => 150,
        "/report/voa/items/0/accounts/0/balances/nsf_overdraft_transactions_count" => 0,
        "/report/voa/items/0/accounts/0/days_available" => 90,
        "/report/voa/items/0/accounts/0/transactions_insights/all_transactions/0/amount" => 89.4,
        "/report/voa/items/0/accounts/0/transactions_insights/all_transactions/1/amount" => 12,
        "/report/voa/items/0/accounts/0/transactions_insights/all_transactions/2/amount" => 4.33,
        "/report/voa/items/0/accounts/0/transactions_insights/all_transactions/3/amount" => -500,
        "/report/voa/attributes/total_inflow_amount/amount" => -345.12,
        "/report/voa/attributes/total_outflow_amount/amount" => 235.12,
        "/report/employment_refresh/days_requested" => 60,
        "/report/income/days_requested" => 1,
        "/report/income/income_streams/0/transactions/0/amount" => 1.1
      }
    )
  end

  def test_check_report_get_verification_throws_bad_request_error_with_wiremock
    test_id = "check_report.get_verification.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_verification(
        reports_requested: %w[VOA VOA],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "check_report.get_verification.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_verification_throws_unauthorized_error_with_wiremock
    test_id = "check_report.get_verification.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.check_report.get_verification(
        reports_requested: %w[VOA VOA],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "check_report.get_verification.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_verification_throws_too_many_requests_error_with_wiremock
    test_id = "check_report.get_verification.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_verification(
        reports_requested: %w[VOA VOA],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "check_report.get_verification.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_verification_throws_internal_server_error_with_wiremock
    test_id = "check_report.get_verification.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_verification(
        reports_requested: %w[VOA VOA],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "check_report.get_verification.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_verification_throws_client_request_error_with_wiremock
    test_id = "check_report.get_verification.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_verification(
        reports_requested: %w[VOA VOA],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "check_report.get_verification.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_verification_throws_server_error_with_wiremock
    test_id = "check_report.get_verification.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_verification(
        reports_requested: %w[VOA VOA],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "check_report.get_verification.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_verification_pdf_with_wiremock
    test_id = "check_report.get_verification_pdf.0"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_verification_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_verification_pdf.0"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_verification_pdf_throws_unauthorized_error_with_wiremock
    test_id = "check_report.get_verification_pdf.1"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.check_report.get_verification_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_verification_pdf.1"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_verification_pdf_throws_too_many_requests_error_with_wiremock
    test_id = "check_report.get_verification_pdf.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_verification_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_verification_pdf.2"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_verification_pdf_throws_internal_server_error_with_wiremock
    test_id = "check_report.get_verification_pdf.3"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_verification_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_verification_pdf.3"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_verification_pdf_throws_client_request_error_with_wiremock
    test_id = "check_report.get_verification_pdf.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.check_report.get_verification_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_verification_pdf.4"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/pdf/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_check_report_get_verification_pdf_throws_server_error_with_wiremock
    test_id = "check_report.get_verification_pdf.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.check_report.get_verification_pdf(request_options: {
        additional_headers: {
          "X-Test-Id" => "check_report.get_verification_pdf.5"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/check_report/verification/pdf/get",
      query_params: nil,
      expected: 1
    )
  end
end
