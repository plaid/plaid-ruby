# frozen_string_literal: true

require_relative "wiremock_test_case"

class LoansWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_loans_register_applications_with_wiremock
    test_id = "loans.register_applications.0"

    @client.loans.register_applications(
      applications: [{
        user_token: "user_token",
        application_id: "application_id",
        type: "PERSONAL",
        decision: "APPROVED"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loans.register_applications.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/applications/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_applications_throws_bad_request_error_with_wiremock
    test_id = "loans.register_applications.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.loans.register_applications(
        applications: [{
          user_token: "user_token",
          application_id: "application_id",
          type: "PERSONAL",
          decision: "APPROVED"
        }, {
          user_token: "user_token",
          application_id: "application_id",
          type: "PERSONAL",
          decision: "APPROVED"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.register_applications.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/applications/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_applications_throws_unauthorized_error_with_wiremock
    test_id = "loans.register_applications.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.loans.register_applications(
        applications: [{
          user_token: "user_token",
          application_id: "application_id",
          type: "PERSONAL",
          decision: "APPROVED"
        }, {
          user_token: "user_token",
          application_id: "application_id",
          type: "PERSONAL",
          decision: "APPROVED"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.register_applications.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/applications/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_applications_throws_too_many_requests_error_with_wiremock
    test_id = "loans.register_applications.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.loans.register_applications(
        applications: [{
          user_token: "user_token",
          application_id: "application_id",
          type: "PERSONAL",
          decision: "APPROVED"
        }, {
          user_token: "user_token",
          application_id: "application_id",
          type: "PERSONAL",
          decision: "APPROVED"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.register_applications.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/applications/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_applications_throws_internal_server_error_with_wiremock
    test_id = "loans.register_applications.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.loans.register_applications(
        applications: [{
          user_token: "user_token",
          application_id: "application_id",
          type: "PERSONAL",
          decision: "APPROVED"
        }, {
          user_token: "user_token",
          application_id: "application_id",
          type: "PERSONAL",
          decision: "APPROVED"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.register_applications.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/applications/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_applications_throws_client_request_error_with_wiremock
    test_id = "loans.register_applications.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.loans.register_applications(
        applications: [{
          user_token: "user_token",
          application_id: "application_id",
          type: "PERSONAL",
          decision: "APPROVED"
        }, {
          user_token: "user_token",
          application_id: "application_id",
          type: "PERSONAL",
          decision: "APPROVED"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.register_applications.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/applications/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_applications_throws_server_error_with_wiremock
    test_id = "loans.register_applications.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.loans.register_applications(
        applications: [{
          user_token: "user_token",
          application_id: "application_id",
          type: "PERSONAL",
          decision: "APPROVED"
        }, {
          user_token: "user_token",
          application_id: "application_id",
          type: "PERSONAL",
          decision: "APPROVED"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.register_applications.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/applications/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_with_wiremock
    test_id = "loans.register.0"

    @client.loans.register(
      loans: [{
        user_token: "user_token",
        loan_id: "loan_id",
        type: "PERSONAL",
        payment_schedule: "DAILY",
        opened_date: "2023-01-15",
        opened_with_status: {
          status: "APPROVED",
          date: "2023-01-15"
        }
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loans.register.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_throws_bad_request_error_with_wiremock
    test_id = "loans.register.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.loans.register(
        loans: [{
          user_token: "user_token",
          loan_id: "loan_id",
          type: "PERSONAL",
          payment_schedule: "DAILY",
          opened_date: "2023-01-15",
          opened_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }, {
          user_token: "user_token",
          loan_id: "loan_id",
          type: "PERSONAL",
          payment_schedule: "DAILY",
          opened_date: "2023-01-15",
          opened_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.register.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_throws_unauthorized_error_with_wiremock
    test_id = "loans.register.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.loans.register(
        loans: [{
          user_token: "user_token",
          loan_id: "loan_id",
          type: "PERSONAL",
          payment_schedule: "DAILY",
          opened_date: "2023-01-15",
          opened_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }, {
          user_token: "user_token",
          loan_id: "loan_id",
          type: "PERSONAL",
          payment_schedule: "DAILY",
          opened_date: "2023-01-15",
          opened_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.register.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_throws_too_many_requests_error_with_wiremock
    test_id = "loans.register.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.loans.register(
        loans: [{
          user_token: "user_token",
          loan_id: "loan_id",
          type: "PERSONAL",
          payment_schedule: "DAILY",
          opened_date: "2023-01-15",
          opened_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }, {
          user_token: "user_token",
          loan_id: "loan_id",
          type: "PERSONAL",
          payment_schedule: "DAILY",
          opened_date: "2023-01-15",
          opened_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.register.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_throws_internal_server_error_with_wiremock
    test_id = "loans.register.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.loans.register(
        loans: [{
          user_token: "user_token",
          loan_id: "loan_id",
          type: "PERSONAL",
          payment_schedule: "DAILY",
          opened_date: "2023-01-15",
          opened_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }, {
          user_token: "user_token",
          loan_id: "loan_id",
          type: "PERSONAL",
          payment_schedule: "DAILY",
          opened_date: "2023-01-15",
          opened_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.register.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_throws_client_request_error_with_wiremock
    test_id = "loans.register.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.loans.register(
        loans: [{
          user_token: "user_token",
          loan_id: "loan_id",
          type: "PERSONAL",
          payment_schedule: "DAILY",
          opened_date: "2023-01-15",
          opened_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }, {
          user_token: "user_token",
          loan_id: "loan_id",
          type: "PERSONAL",
          payment_schedule: "DAILY",
          opened_date: "2023-01-15",
          opened_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.register.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_register_throws_server_error_with_wiremock
    test_id = "loans.register.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.loans.register(
        loans: [{
          user_token: "user_token",
          loan_id: "loan_id",
          type: "PERSONAL",
          payment_schedule: "DAILY",
          opened_date: "2023-01-15",
          opened_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }, {
          user_token: "user_token",
          loan_id: "loan_id",
          type: "PERSONAL",
          payment_schedule: "DAILY",
          opened_date: "2023-01-15",
          opened_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.register.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/register",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_update_with_wiremock
    test_id = "loans.update.0"

    @client.loans.update(
      loans: [{}],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loans.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_update_throws_bad_request_error_with_wiremock
    test_id = "loans.update.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.loans.update(
        loans: [{}, {}],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.update.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_update_throws_unauthorized_error_with_wiremock
    test_id = "loans.update.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.loans.update(
        loans: [{}, {}],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.update.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_update_throws_too_many_requests_error_with_wiremock
    test_id = "loans.update.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.loans.update(
        loans: [{}, {}],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.update.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_update_throws_internal_server_error_with_wiremock
    test_id = "loans.update.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.loans.update(
        loans: [{}, {}],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.update.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_update_throws_client_request_error_with_wiremock
    test_id = "loans.update.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.loans.update(
        loans: [{}, {}],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.update.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_update_throws_server_error_with_wiremock
    test_id = "loans.update.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.loans.update(
        loans: [{}, {}],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.update.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_unregister_with_wiremock
    test_id = "loans.unregister.0"

    @client.loans.unregister(
      loans: [{
        loan_id: "loan_id",
        closed_with_status: {
          status: "APPROVED",
          date: "2023-01-15"
        }
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loans.unregister.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/unregister",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_unregister_throws_bad_request_error_with_wiremock
    test_id = "loans.unregister.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.loans.unregister(
        loans: [{
          loan_id: "loan_id",
          closed_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }, {
          loan_id: "loan_id",
          closed_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.unregister.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/unregister",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_unregister_throws_unauthorized_error_with_wiremock
    test_id = "loans.unregister.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.loans.unregister(
        loans: [{
          loan_id: "loan_id",
          closed_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }, {
          loan_id: "loan_id",
          closed_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.unregister.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/unregister",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_unregister_throws_too_many_requests_error_with_wiremock
    test_id = "loans.unregister.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.loans.unregister(
        loans: [{
          loan_id: "loan_id",
          closed_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }, {
          loan_id: "loan_id",
          closed_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.unregister.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/unregister",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_unregister_throws_internal_server_error_with_wiremock
    test_id = "loans.unregister.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.loans.unregister(
        loans: [{
          loan_id: "loan_id",
          closed_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }, {
          loan_id: "loan_id",
          closed_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.unregister.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/unregister",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_unregister_throws_client_request_error_with_wiremock
    test_id = "loans.unregister.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.loans.unregister(
        loans: [{
          loan_id: "loan_id",
          closed_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }, {
          loan_id: "loan_id",
          closed_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.unregister.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/unregister",
      query_params: nil,
      expected: 1
    )
  end

  def test_loans_unregister_throws_server_error_with_wiremock
    test_id = "loans.unregister.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.loans.unregister(
        loans: [{
          loan_id: "loan_id",
          closed_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }, {
          loan_id: "loan_id",
          closed_with_status: {
            status: "APPROVED",
            date: "2023-01-15"
          }
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "loans.unregister.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cra/loans/unregister",
      query_params: nil,
      expected: 1
    )
  end
end
