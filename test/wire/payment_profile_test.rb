# frozen_string_literal: true

require_relative "wiremock_test_case"

class PaymentProfileWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_payment_profile_create_with_wiremock
    test_id = "payment_profile.create.0"

    @client.payment_profile.create(request_options: {
      additional_headers: {
        "X-Test-Id" => "payment_profile.create.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_create_throws_bad_request_error_with_wiremock
    test_id = "payment_profile.create.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_profile.create(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_profile.create.1"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_create_throws_unauthorized_error_with_wiremock
    test_id = "payment_profile.create.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_profile.create(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_profile.create.2"
        }
      })
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_create_throws_too_many_requests_error_with_wiremock
    test_id = "payment_profile.create.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_profile.create(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_profile.create.3"
        }
      })
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_create_throws_internal_server_error_with_wiremock
    test_id = "payment_profile.create.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_profile.create(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_profile.create.4"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_create_throws_client_request_error_with_wiremock
    test_id = "payment_profile.create.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_profile.create(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_profile.create.5"
        }
      })
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_create_throws_server_error_with_wiremock
    test_id = "payment_profile.create.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_profile.create(request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_profile.create.6"
        }
      })
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_get_with_wiremock
    test_id = "payment_profile.get.0"

    @client.payment_profile.get(
      payment_profile_token: "payment_profile_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_profile.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_get_throws_bad_request_error_with_wiremock
    test_id = "payment_profile.get.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_profile.get(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_profile.get.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_get_throws_unauthorized_error_with_wiremock
    test_id = "payment_profile.get.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_profile.get(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_profile.get.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_get_throws_too_many_requests_error_with_wiremock
    test_id = "payment_profile.get.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_profile.get(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_profile.get.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_get_throws_internal_server_error_with_wiremock
    test_id = "payment_profile.get.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_profile.get(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_profile.get.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_get_throws_client_request_error_with_wiremock
    test_id = "payment_profile.get.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_profile.get(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_profile.get.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_get_throws_server_error_with_wiremock
    test_id = "payment_profile.get.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_profile.get(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_profile.get.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_remove_with_wiremock
    test_id = "payment_profile.remove.0"

    @client.payment_profile.remove(
      payment_profile_token: "payment_profile_token",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_profile.remove.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_remove_throws_bad_request_error_with_wiremock
    test_id = "payment_profile.remove.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_profile.remove(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_profile.remove.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_remove_throws_unauthorized_error_with_wiremock
    test_id = "payment_profile.remove.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.payment_profile.remove(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_profile.remove.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_remove_throws_too_many_requests_error_with_wiremock
    test_id = "payment_profile.remove.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_profile.remove(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_profile.remove.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_remove_throws_internal_server_error_with_wiremock
    test_id = "payment_profile.remove.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_profile.remove(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_profile.remove.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_remove_throws_client_request_error_with_wiremock
    test_id = "payment_profile.remove.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.payment_profile.remove(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_profile.remove.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_profile_remove_throws_server_error_with_wiremock
    test_id = "payment_profile.remove.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.payment_profile.remove(
        payment_profile_token: "payment_profile_token",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "payment_profile.remove.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment_profile/remove",
      query_params: nil,
      expected: 1
    )
  end
end
