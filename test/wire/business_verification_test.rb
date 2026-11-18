# frozen_string_literal: true

require_relative "wiremock_test_case"

class BusinessVerificationWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_business_verification_get_with_wiremock
    test_id = "business_verification.get.0"

    result = @client.business_verification.get(
      business_verification_id: "busver_52xR9LKo77r1Np",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "business_verification.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/get",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/business_verification/score" => 95,
        "/business_verification/address/validation/standardized_address/lat" => 34.09031,
        "/business_verification/address/validation/standardized_address/lon" => -118.40606,
        "/business_verification/business_details/addresses/0/lat" => 34.08031,
        "/business_verification/business_details/addresses/0/lon" => -118.41606,
        "/business_verification/business_details/addresses/1/lat" => 34.07031,
        "/business_verification/business_details/addresses/1/lon" => -118.42606,
        "/business_verification/business_details/addresses/2/lat" => 34.10031,
        "/business_verification/business_details/addresses/2/lon" => -118.39606,
        "/business_verification/business_details/registrations/0/address/lat" => 34.09031,
        "/business_verification/business_details/registrations/0/address/lon" => -118.40606,
        "/business_verification/business_details/registrations/0/registered_agent/address/lat" => 34.08031,
        "/business_verification/business_details/registrations/0/registered_agent/address/lon" => -118.41606,
        "/risk_check/score" => 84,
        "/digital_presence_check/score" => 85
      }
    )
  end

  def test_business_verification_get_throws_bad_request_error_with_wiremock
    test_id = "business_verification.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.business_verification.get(
        business_verification_id: "business_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "business_verification.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_business_verification_get_throws_unauthorized_error_with_wiremock
    test_id = "business_verification.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.business_verification.get(
        business_verification_id: "business_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "business_verification.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_business_verification_get_throws_too_many_requests_error_with_wiremock
    test_id = "business_verification.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.business_verification.get(
        business_verification_id: "business_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "business_verification.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_business_verification_get_throws_internal_server_error_with_wiremock
    test_id = "business_verification.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.business_verification.get(
        business_verification_id: "business_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "business_verification.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_business_verification_get_throws_client_request_error_with_wiremock
    test_id = "business_verification.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.business_verification.get(
        business_verification_id: "business_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "business_verification.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_business_verification_get_throws_server_error_with_wiremock
    test_id = "business_verification.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.business_verification.get(
        business_verification_id: "business_verification_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "business_verification.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_business_verification_create_with_wiremock
    test_id = "business_verification.create.0"

    @client.business_verification.create(
      client_user_id: "your-db-id-3b24110",
      business: {
        name: "Acme Corporation",
        address: {
          street: "123 Main St.",
          city: "Pawnee",
          country: "US"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "business_verification.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_business_verification_create_throws_bad_request_error_with_wiremock
    test_id = "business_verification.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.business_verification.create(
        client_user_id: "client_user_id",
        business: {
          name: "name",
          address: {
            street: "street",
            city: "city",
            country: "country"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "business_verification.create.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_business_verification_create_throws_unauthorized_error_with_wiremock
    test_id = "business_verification.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.business_verification.create(
        client_user_id: "client_user_id",
        business: {
          name: "name",
          address: {
            street: "street",
            city: "city",
            country: "country"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "business_verification.create.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_business_verification_create_throws_too_many_requests_error_with_wiremock
    test_id = "business_verification.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.business_verification.create(
        client_user_id: "client_user_id",
        business: {
          name: "name",
          address: {
            street: "street",
            city: "city",
            country: "country"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "business_verification.create.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_business_verification_create_throws_internal_server_error_with_wiremock
    test_id = "business_verification.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.business_verification.create(
        client_user_id: "client_user_id",
        business: {
          name: "name",
          address: {
            street: "street",
            city: "city",
            country: "country"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "business_verification.create.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_business_verification_create_throws_client_request_error_with_wiremock
    test_id = "business_verification.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.business_verification.create(
        client_user_id: "client_user_id",
        business: {
          name: "name",
          address: {
            street: "street",
            city: "city",
            country: "country"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "business_verification.create.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_business_verification_create_throws_server_error_with_wiremock
    test_id = "business_verification.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.business_verification.create(
        client_user_id: "client_user_id",
        business: {
          name: "name",
          address: {
            street: "street",
            city: "city",
            country: "country"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "business_verification.create.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/business_verification/create",
      query_params: nil,
      expected: 1
    )
  end
end
