# frozen_string_literal: true

require_relative "wiremock_test_case"

class IncomeVerificationWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_income_verification_create_with_wiremock
    test_id = "income_verification.create.0"

    @client.income_verification.create(
      webhook: "webhook",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_create_throws_bad_request_error_with_wiremock
    test_id = "income_verification.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.create(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "income_verification.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_create_throws_unauthorized_error_with_wiremock
    test_id = "income_verification.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.income_verification.create(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "income_verification.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_create_throws_too_many_requests_error_with_wiremock
    test_id = "income_verification.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.create(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "income_verification.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_create_throws_internal_server_error_with_wiremock
    test_id = "income_verification.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.income_verification.create(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "income_verification.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_create_throws_client_request_error_with_wiremock
    test_id = "income_verification.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.create(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "income_verification.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_create_throws_server_error_with_wiremock
    test_id = "income_verification.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.income_verification.create(
        webhook: "webhook",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "income_verification.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_get_paystubs_with_wiremock
    test_id = "income_verification.get_paystubs.0"

    result = @client.income_verification.get_paystubs(request_options: {
      additional_headers: {
        "X-Test-Id" => "income_verification.get_paystubs.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/paystubs/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/paystubs/0/deductions/breakdown/0/current_amount" => 123.45,
        "/paystubs/0/deductions/breakdown/0/ytd_amount" => 246.9,
        "/paystubs/0/deductions/total/current_amount" => 123.45,
        "/paystubs/0/deductions/total/ytd_amount" => 246.9,
        "/paystubs/0/earnings/breakdown/0/current_amount" => 200.22,
        "/paystubs/0/earnings/breakdown/0/hours" => 80,
        "/paystubs/0/earnings/breakdown/0/ytd_amount" => 400.44,
        "/paystubs/0/earnings/breakdown/1/current_amount" => 100,
        "/paystubs/0/earnings/breakdown/1/ytd_amount" => 100,
        "/paystubs/0/earnings/total/current_amount" => 300.22,
        "/paystubs/0/earnings/total/hours" => 160,
        "/paystubs/0/earnings/total/ytd_amount" => 500.44,
        "/paystubs/0/net_pay/current_amount" => 123.34,
        "/paystubs/0/net_pay/ytd_amount" => 253.54,
        "/paystubs/0/pay_period_details/check_amount" => 1490.21,
        "/paystubs/0/pay_period_details/distribution_breakdown/0/current_amount" => 176.77,
        "/paystubs/0/pay_period_details/gross_earnings" => 4500,
        "/error/status" => 1
      }
    )
  end

  def test_income_verification_get_paystubs_throws_bad_request_error_with_wiremock
    test_id = "income_verification.get_paystubs.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.get_paystubs(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.get_paystubs.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/paystubs/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_get_paystubs_throws_unauthorized_error_with_wiremock
    test_id = "income_verification.get_paystubs.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.income_verification.get_paystubs(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.get_paystubs.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/paystubs/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_get_paystubs_throws_too_many_requests_error_with_wiremock
    test_id = "income_verification.get_paystubs.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.get_paystubs(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.get_paystubs.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/paystubs/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_get_paystubs_throws_internal_server_error_with_wiremock
    test_id = "income_verification.get_paystubs.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.income_verification.get_paystubs(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.get_paystubs.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/paystubs/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_get_paystubs_throws_client_request_error_with_wiremock
    test_id = "income_verification.get_paystubs.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.get_paystubs(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.get_paystubs.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/paystubs/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_get_paystubs_throws_server_error_with_wiremock
    test_id = "income_verification.get_paystubs.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.income_verification.get_paystubs(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.get_paystubs.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/paystubs/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_download_documents_with_wiremock
    test_id = "income_verification.download_documents.0"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.download_documents(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.download_documents.0"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/documents/download",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_download_documents_throws_unauthorized_error_with_wiremock
    test_id = "income_verification.download_documents.1"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.income_verification.download_documents(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.download_documents.1"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/documents/download",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_download_documents_throws_too_many_requests_error_with_wiremock
    test_id = "income_verification.download_documents.2"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.download_documents(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.download_documents.2"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/documents/download",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_download_documents_throws_internal_server_error_with_wiremock
    test_id = "income_verification.download_documents.3"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.income_verification.download_documents(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.download_documents.3"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/documents/download",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_download_documents_throws_client_request_error_with_wiremock
    test_id = "income_verification.download_documents.4"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.download_documents(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.download_documents.4"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/documents/download",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_download_documents_throws_server_error_with_wiremock
    test_id = "income_verification.download_documents.5"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.income_verification.download_documents(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.download_documents.5"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/documents/download",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_get_taxforms_with_wiremock
    test_id = "income_verification.get_taxforms.0"

    result = @client.income_verification.get_taxforms(request_options: {
      additional_headers: {
        "X-Test-Id" => "income_verification.get_taxforms.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/taxforms/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/error/status" => 1
      }
    )
  end

  def test_income_verification_get_taxforms_throws_bad_request_error_with_wiremock
    test_id = "income_verification.get_taxforms.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.get_taxforms(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.get_taxforms.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/taxforms/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_get_taxforms_throws_unauthorized_error_with_wiremock
    test_id = "income_verification.get_taxforms.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.income_verification.get_taxforms(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.get_taxforms.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/taxforms/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_get_taxforms_throws_too_many_requests_error_with_wiremock
    test_id = "income_verification.get_taxforms.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.get_taxforms(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.get_taxforms.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/taxforms/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_get_taxforms_throws_internal_server_error_with_wiremock
    test_id = "income_verification.get_taxforms.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.income_verification.get_taxforms(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.get_taxforms.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/taxforms/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_get_taxforms_throws_client_request_error_with_wiremock
    test_id = "income_verification.get_taxforms.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.get_taxforms(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.get_taxforms.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/taxforms/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_get_taxforms_throws_server_error_with_wiremock
    test_id = "income_verification.get_taxforms.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.income_verification.get_taxforms(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.get_taxforms.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/taxforms/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_precheck_with_wiremock
    test_id = "income_verification.precheck.0"

    @client.income_verification.precheck(request_options: {
      additional_headers: {
        "X-Test-Id" => "income_verification.precheck.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_precheck_throws_bad_request_error_with_wiremock
    test_id = "income_verification.precheck.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.precheck(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.precheck.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_precheck_throws_unauthorized_error_with_wiremock
    test_id = "income_verification.precheck.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.income_verification.precheck(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.precheck.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_precheck_throws_too_many_requests_error_with_wiremock
    test_id = "income_verification.precheck.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.precheck(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.precheck.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_precheck_throws_internal_server_error_with_wiremock
    test_id = "income_verification.precheck.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.income_verification.precheck(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.precheck.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_precheck_throws_client_request_error_with_wiremock
    test_id = "income_verification.precheck.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.income_verification.precheck(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.precheck.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/precheck",
      query_params: nil,
      expected: 1
    )
  end

  def test_income_verification_precheck_throws_server_error_with_wiremock
    test_id = "income_verification.precheck.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.income_verification.precheck(request_options: {
        additional_headers: {
          "X-Test-Id" => "income_verification.precheck.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/income/verification/precheck",
      query_params: nil,
      expected: 1
    )
  end
end
