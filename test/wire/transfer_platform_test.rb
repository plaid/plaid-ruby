# frozen_string_literal: true

require_relative "wiremock_test_case"

class TransferPlatformWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_transfer_platform_submit_requirement_with_wiremock
    test_id = "transfer.platform.submit_requirement.0"

    @client.transfer.platform.submit_requirement(
      originator_client_id: "originator_client_id",
      requirement_submissions: [{
        requirement_type: "requirement_type",
        value: "value"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.platform.submit_requirement.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/requirement/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_submit_requirement_throws_bad_request_error_with_wiremock
    test_id = "transfer.platform.submit_requirement.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.platform.submit_requirement(
        originator_client_id: "originator_client_id",
        requirement_submissions: [{
          requirement_type: "requirement_type",
          value: "value"
        }, {
          requirement_type: "requirement_type",
          value: "value"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.submit_requirement.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/requirement/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_submit_requirement_throws_unauthorized_error_with_wiremock
    test_id = "transfer.platform.submit_requirement.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.platform.submit_requirement(
        originator_client_id: "originator_client_id",
        requirement_submissions: [{
          requirement_type: "requirement_type",
          value: "value"
        }, {
          requirement_type: "requirement_type",
          value: "value"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.submit_requirement.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/requirement/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_submit_requirement_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.platform.submit_requirement.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.platform.submit_requirement(
        originator_client_id: "originator_client_id",
        requirement_submissions: [{
          requirement_type: "requirement_type",
          value: "value"
        }, {
          requirement_type: "requirement_type",
          value: "value"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.submit_requirement.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/requirement/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_submit_requirement_throws_internal_server_error_with_wiremock
    test_id = "transfer.platform.submit_requirement.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.platform.submit_requirement(
        originator_client_id: "originator_client_id",
        requirement_submissions: [{
          requirement_type: "requirement_type",
          value: "value"
        }, {
          requirement_type: "requirement_type",
          value: "value"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.submit_requirement.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/requirement/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_submit_requirement_throws_client_request_error_with_wiremock
    test_id = "transfer.platform.submit_requirement.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.platform.submit_requirement(
        originator_client_id: "originator_client_id",
        requirement_submissions: [{
          requirement_type: "requirement_type",
          value: "value"
        }, {
          requirement_type: "requirement_type",
          value: "value"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.submit_requirement.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/requirement/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_submit_requirement_throws_server_error_with_wiremock
    test_id = "transfer.platform.submit_requirement.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.platform.submit_requirement(
        originator_client_id: "originator_client_id",
        requirement_submissions: [{
          requirement_type: "requirement_type",
          value: "value"
        }, {
          requirement_type: "requirement_type",
          value: "value"
        }],
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.submit_requirement.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/requirement/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_originator_with_wiremock
    test_id = "transfer.platform.create_originator.0"

    @client.transfer.platform.create_originator(
      originator_client_id: "originator_client_id",
      tos_acceptance_metadata: {
        agreement_accepted: true,
        originator_ip_address: "originator_ip_address",
        agreement_accepted_at: "2024-01-15T09:30:00Z"
      },
      originator_reviewed_at: "2024-01-15T09:30:00Z",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.platform.create_originator.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_originator_throws_bad_request_error_with_wiremock
    test_id = "transfer.platform.create_originator.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.platform.create_originator(
        originator_client_id: "originator_client_id",
        tos_acceptance_metadata: {
          agreement_accepted: true,
          originator_ip_address: "originator_ip_address",
          agreement_accepted_at: "2024-01-15T09:30:00Z"
        },
        originator_reviewed_at: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.create_originator.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_originator_throws_unauthorized_error_with_wiremock
    test_id = "transfer.platform.create_originator.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.platform.create_originator(
        originator_client_id: "originator_client_id",
        tos_acceptance_metadata: {
          agreement_accepted: true,
          originator_ip_address: "originator_ip_address",
          agreement_accepted_at: "2024-01-15T09:30:00Z"
        },
        originator_reviewed_at: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.create_originator.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_originator_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.platform.create_originator.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.platform.create_originator(
        originator_client_id: "originator_client_id",
        tos_acceptance_metadata: {
          agreement_accepted: true,
          originator_ip_address: "originator_ip_address",
          agreement_accepted_at: "2024-01-15T09:30:00Z"
        },
        originator_reviewed_at: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.create_originator.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_originator_throws_internal_server_error_with_wiremock
    test_id = "transfer.platform.create_originator.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.platform.create_originator(
        originator_client_id: "originator_client_id",
        tos_acceptance_metadata: {
          agreement_accepted: true,
          originator_ip_address: "originator_ip_address",
          agreement_accepted_at: "2024-01-15T09:30:00Z"
        },
        originator_reviewed_at: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.create_originator.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_originator_throws_client_request_error_with_wiremock
    test_id = "transfer.platform.create_originator.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.platform.create_originator(
        originator_client_id: "originator_client_id",
        tos_acceptance_metadata: {
          agreement_accepted: true,
          originator_ip_address: "originator_ip_address",
          agreement_accepted_at: "2024-01-15T09:30:00Z"
        },
        originator_reviewed_at: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.create_originator.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_originator_throws_server_error_with_wiremock
    test_id = "transfer.platform.create_originator.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.platform.create_originator(
        originator_client_id: "originator_client_id",
        tos_acceptance_metadata: {
          agreement_accepted: true,
          originator_ip_address: "originator_ip_address",
          agreement_accepted_at: "2024-01-15T09:30:00Z"
        },
        originator_reviewed_at: "2024-01-15T09:30:00Z",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.create_originator.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/originator/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_person_with_wiremock
    test_id = "transfer.platform.create_person.0"

    @client.transfer.platform.create_person(
      originator_client_id: "originator_client_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.platform.create_person.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/person/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_person_throws_bad_request_error_with_wiremock
    test_id = "transfer.platform.create_person.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.platform.create_person(
        originator_client_id: "originator_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.create_person.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/person/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_person_throws_unauthorized_error_with_wiremock
    test_id = "transfer.platform.create_person.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.platform.create_person(
        originator_client_id: "originator_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.create_person.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/person/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_person_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.platform.create_person.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.platform.create_person(
        originator_client_id: "originator_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.create_person.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/person/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_person_throws_internal_server_error_with_wiremock
    test_id = "transfer.platform.create_person.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.platform.create_person(
        originator_client_id: "originator_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.create_person.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/person/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_person_throws_client_request_error_with_wiremock
    test_id = "transfer.platform.create_person.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.platform.create_person(
        originator_client_id: "originator_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.create_person.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/person/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_platform_create_person_throws_server_error_with_wiremock
    test_id = "transfer.platform.create_person.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.platform.create_person(
        originator_client_id: "originator_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.platform.create_person.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/platform/person/create",
      query_params: nil,
      expected: 1
    )
  end
end
