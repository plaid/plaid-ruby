# frozen_string_literal: true

require_relative "wiremock_test_case"

class PartnerWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_partner_create_customer_with_wiremock
    test_id = "partner.create_customer.0"

    @client.partner.create_customer(
      company_name: "Plaid",
      is_diligence_attested: true,
      products: %w[auth identity],
      create_link_customization: true,
      legal_entity_name: "Plaid",
      website: "plaid.com",
      application_name: "Plaid",
      technical_contact: {
        given_name: "Alice",
        family_name: "Smith",
        email: "alice.smith@example.com"
      },
      billing_contact: {
        given_name: "Bob",
        family_name: "Jones",
        email: "bob.jones@example.com"
      },
      customer_support_info: {
        email: "support@example.com",
        phone_number: "1234567890",
        contact_url: "example.com/contact",
        link_update_url: "example.com/update"
      },
      address: {
        city: "New York",
        street: "123 Main St",
        region: "NY",
        postal_code: "12345",
        country_code: "US"
      },
      is_bank_addendum_completed: true,
      redirect_uris: %w[http://localhost/oauth.html https://www.example.com/oauth.html],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "partner.create_customer.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_throws_bad_request_error_with_wiremock
    test_id = "partner.create_customer.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.create_customer(
        company_name: "company_name",
        is_diligence_attested: true,
        legal_entity_name: "legal_entity_name",
        website: "website",
        application_name: "application_name",
        address: {},
        is_bank_addendum_completed: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.create_customer.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_throws_unauthorized_error_with_wiremock
    test_id = "partner.create_customer.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.partner.create_customer(
        company_name: "company_name",
        is_diligence_attested: true,
        legal_entity_name: "legal_entity_name",
        website: "website",
        application_name: "application_name",
        address: {},
        is_bank_addendum_completed: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.create_customer.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_throws_too_many_requests_error_with_wiremock
    test_id = "partner.create_customer.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.create_customer(
        company_name: "company_name",
        is_diligence_attested: true,
        legal_entity_name: "legal_entity_name",
        website: "website",
        application_name: "application_name",
        address: {},
        is_bank_addendum_completed: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.create_customer.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_throws_internal_server_error_with_wiremock
    test_id = "partner.create_customer.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.create_customer(
        company_name: "company_name",
        is_diligence_attested: true,
        legal_entity_name: "legal_entity_name",
        website: "website",
        application_name: "application_name",
        address: {},
        is_bank_addendum_completed: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.create_customer.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_throws_client_request_error_with_wiremock
    test_id = "partner.create_customer.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.create_customer(
        company_name: "company_name",
        is_diligence_attested: true,
        legal_entity_name: "legal_entity_name",
        website: "website",
        application_name: "application_name",
        address: {},
        is_bank_addendum_completed: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.create_customer.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_throws_server_error_with_wiremock
    test_id = "partner.create_customer.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.create_customer(
        company_name: "company_name",
        is_diligence_attested: true,
        legal_entity_name: "legal_entity_name",
        website: "website",
        application_name: "application_name",
        address: {},
        is_bank_addendum_completed: true,
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.create_customer.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_with_wiremock
    test_id = "partner.get_customer.0"

    @client.partner.get_customer(
      end_customer_client_id: "7f57eb3d2a9j6480121fx361",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "partner.get_customer.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_throws_bad_request_error_with_wiremock
    test_id = "partner.get_customer.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.get_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_throws_unauthorized_error_with_wiremock
    test_id = "partner.get_customer.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.partner.get_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_throws_too_many_requests_error_with_wiremock
    test_id = "partner.get_customer.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.get_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_throws_internal_server_error_with_wiremock
    test_id = "partner.get_customer.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.get_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_throws_client_request_error_with_wiremock
    test_id = "partner.get_customer.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.get_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_throws_server_error_with_wiremock
    test_id = "partner.get_customer.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.get_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_with_wiremock
    test_id = "partner.enable_customer.0"

    @client.partner.enable_customer(
      end_customer_client_id: "7f57eb3d2a9j6480121fx361",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "partner.enable_customer.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_throws_bad_request_error_with_wiremock
    test_id = "partner.enable_customer.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.enable_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.enable_customer.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_throws_unauthorized_error_with_wiremock
    test_id = "partner.enable_customer.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.partner.enable_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.enable_customer.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_throws_too_many_requests_error_with_wiremock
    test_id = "partner.enable_customer.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.enable_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.enable_customer.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_throws_internal_server_error_with_wiremock
    test_id = "partner.enable_customer.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.enable_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.enable_customer.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_throws_client_request_error_with_wiremock
    test_id = "partner.enable_customer.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.enable_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.enable_customer.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_throws_server_error_with_wiremock
    test_id = "partner.enable_customer.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.enable_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.enable_customer.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_remove_customer_with_wiremock
    test_id = "partner.remove_customer.0"

    @client.partner.remove_customer(
      end_customer_client_id: "7f57eb3d2a9j6480121fx361",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "partner.remove_customer.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_remove_customer_throws_bad_request_error_with_wiremock
    test_id = "partner.remove_customer.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.remove_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.remove_customer.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_remove_customer_throws_unauthorized_error_with_wiremock
    test_id = "partner.remove_customer.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.partner.remove_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.remove_customer.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_remove_customer_throws_too_many_requests_error_with_wiremock
    test_id = "partner.remove_customer.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.remove_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.remove_customer.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_remove_customer_throws_internal_server_error_with_wiremock
    test_id = "partner.remove_customer.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.remove_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.remove_customer.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_remove_customer_throws_client_request_error_with_wiremock
    test_id = "partner.remove_customer.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.remove_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.remove_customer.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_remove_customer_throws_server_error_with_wiremock
    test_id = "partner.remove_customer.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.remove_customer(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.remove_customer.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/remove",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_oauth_institutions_with_wiremock
    test_id = "partner.get_customer_oauth_institutions.0"

    @client.partner.get_customer_oauth_institutions(
      end_customer_client_id: "7f57eb3d2a9j6480121fx361",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "partner.get_customer_oauth_institutions.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/oauth_institutions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_oauth_institutions_throws_bad_request_error_with_wiremock
    test_id = "partner.get_customer_oauth_institutions.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.get_customer_oauth_institutions(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer_oauth_institutions.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/oauth_institutions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_oauth_institutions_throws_unauthorized_error_with_wiremock
    test_id = "partner.get_customer_oauth_institutions.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.partner.get_customer_oauth_institutions(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer_oauth_institutions.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/oauth_institutions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_oauth_institutions_throws_too_many_requests_error_with_wiremock
    test_id = "partner.get_customer_oauth_institutions.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.get_customer_oauth_institutions(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer_oauth_institutions.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/oauth_institutions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_oauth_institutions_throws_internal_server_error_with_wiremock
    test_id = "partner.get_customer_oauth_institutions.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.get_customer_oauth_institutions(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer_oauth_institutions.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/oauth_institutions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_oauth_institutions_throws_client_request_error_with_wiremock
    test_id = "partner.get_customer_oauth_institutions.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.get_customer_oauth_institutions(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer_oauth_institutions.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/oauth_institutions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_oauth_institutions_throws_server_error_with_wiremock
    test_id = "partner.get_customer_oauth_institutions.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.get_customer_oauth_institutions(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer_oauth_institutions.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/partner/customer/oauth_institutions/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_v1_with_wiremock
    test_id = "partner.create_customer_v1.0"

    @client.partner.create_customer_v1(
      company_name: "Plaid",
      products: %w[auth identity],
      create_link_customization: true,
      legal_entity_name: "Plaid",
      website: "plaid.com",
      application_name: "Plaid",
      technical_contact: {
        given_name: "Alice",
        family_name: "Smith",
        email: "alice.smith@example.com"
      },
      billing_contact: {
        given_name: "Bob",
        family_name: "Jones",
        email: "bob.jones@example.com"
      },
      customer_support_info: {
        email: "support@example.com",
        phone_number: "1234567890",
        contact_url: "example.com/contact",
        link_update_url: "example.com/update"
      },
      address: {
        city: "New York",
        street: "123 Main St",
        region: "NY",
        postal_code: "12345",
        country_code: "US"
      },
      redirect_uris: %w[http://localhost/oauth.html https://www.example.com/oauth.html],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "partner.create_customer_v1.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_v1_throws_bad_request_error_with_wiremock
    test_id = "partner.create_customer_v1.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.create_customer_v1(
        company_name: "company_name",
        website: "website",
        application_name: "application_name",
        customer_support_info: {},
        address: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.create_customer_v1.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_v1_throws_unauthorized_error_with_wiremock
    test_id = "partner.create_customer_v1.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.partner.create_customer_v1(
        company_name: "company_name",
        website: "website",
        application_name: "application_name",
        customer_support_info: {},
        address: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.create_customer_v1.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_v1_throws_too_many_requests_error_with_wiremock
    test_id = "partner.create_customer_v1.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.create_customer_v1(
        company_name: "company_name",
        website: "website",
        application_name: "application_name",
        customer_support_info: {},
        address: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.create_customer_v1.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_v1_throws_internal_server_error_with_wiremock
    test_id = "partner.create_customer_v1.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.create_customer_v1(
        company_name: "company_name",
        website: "website",
        application_name: "application_name",
        customer_support_info: {},
        address: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.create_customer_v1.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_v1_throws_client_request_error_with_wiremock
    test_id = "partner.create_customer_v1.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.create_customer_v1(
        company_name: "company_name",
        website: "website",
        application_name: "application_name",
        customer_support_info: {},
        address: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.create_customer_v1.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_create_customer_v1_throws_server_error_with_wiremock
    test_id = "partner.create_customer_v1.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.create_customer_v1(
        company_name: "company_name",
        website: "website",
        application_name: "application_name",
        customer_support_info: {},
        address: {},
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.create_customer_v1.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_v1_with_wiremock
    test_id = "partner.get_customer_v1.0"

    @client.partner.get_customer_v1(
      end_customer_client_id: "634758733ebb4f00134b85ea",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "partner.get_customer_v1.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_v1_throws_bad_request_error_with_wiremock
    test_id = "partner.get_customer_v1.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.get_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer_v1.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_v1_throws_unauthorized_error_with_wiremock
    test_id = "partner.get_customer_v1.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.partner.get_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer_v1.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_v1_throws_too_many_requests_error_with_wiremock
    test_id = "partner.get_customer_v1.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.get_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer_v1.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_v1_throws_internal_server_error_with_wiremock
    test_id = "partner.get_customer_v1.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.get_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer_v1.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_v1_throws_client_request_error_with_wiremock
    test_id = "partner.get_customer_v1.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.get_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer_v1.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_get_customer_v1_throws_server_error_with_wiremock
    test_id = "partner.get_customer_v1.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.get_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.get_customer_v1.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_update_customer_v1_with_wiremock
    test_id = "partner.update_customer_v1.0"

    @client.partner.update_customer_v1(
      end_customer_client_id: "634758733ebb4f00134b85ea",
      bank_addendum_acceptance: {
        customer_accepted: true,
        customer_ip_address: "127.0.0.1",
        customer_agreement_timestamp: "2025-01-01T01:00:00Z"
      },
      questionnaires: {
        cra: {
          purposes: {
            WRITTEN_INSTRUCTION: {
              use_cases: %w[CREDIT_UNDERWRITING TENANT_SCREENING]
            }
          },
          is_third_party_involved: true,
          is_technical_service_provider_involved: true
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "partner.update_customer_v1.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_update_customer_v1_throws_bad_request_error_with_wiremock
    test_id = "partner.update_customer_v1.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.update_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.update_customer_v1.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_update_customer_v1_throws_unauthorized_error_with_wiremock
    test_id = "partner.update_customer_v1.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.partner.update_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.update_customer_v1.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_update_customer_v1_throws_too_many_requests_error_with_wiremock
    test_id = "partner.update_customer_v1.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.update_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.update_customer_v1.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_update_customer_v1_throws_internal_server_error_with_wiremock
    test_id = "partner.update_customer_v1.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.update_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.update_customer_v1.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_update_customer_v1_throws_client_request_error_with_wiremock
    test_id = "partner.update_customer_v1.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.update_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.update_customer_v1.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_update_customer_v1_throws_server_error_with_wiremock
    test_id = "partner.update_customer_v1.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.update_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.update_customer_v1.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_v1_with_wiremock
    test_id = "partner.enable_customer_v1.0"

    @client.partner.enable_customer_v1(
      end_customer_client_id: "634758733ebb4f00134b85ea",
      products: ["auth"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "partner.enable_customer_v1.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_v1_throws_bad_request_error_with_wiremock
    test_id = "partner.enable_customer_v1.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.enable_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.enable_customer_v1.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_v1_throws_unauthorized_error_with_wiremock
    test_id = "partner.enable_customer_v1.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.partner.enable_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.enable_customer_v1.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_v1_throws_too_many_requests_error_with_wiremock
    test_id = "partner.enable_customer_v1.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.enable_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.enable_customer_v1.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_v1_throws_internal_server_error_with_wiremock
    test_id = "partner.enable_customer_v1.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.enable_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.enable_customer_v1.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_v1_throws_client_request_error_with_wiremock
    test_id = "partner.enable_customer_v1.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.partner.enable_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.enable_customer_v1.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_partner_enable_customer_v1_throws_server_error_with_wiremock
    test_id = "partner.enable_customer_v1.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.partner.enable_customer_v1(
        end_customer_client_id: "end_customer_client_id",
        request_options: {
          additional_headers: {
            "X-Test-Id" => "partner.enable_customer_v1.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/beta/partner/customer/v1/enable",
      query_params: nil,
      expected: 1
    )
  end
end
