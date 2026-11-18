# frozen_string_literal: true

require_relative "wiremock_test_case"

class TransferDiligenceWireTest < WireMockTestCase
  def setup
    super

    @client = Plaid::PlaidApi.new(
      secret: "test-api-key",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_transfer_diligence_submit_with_wiremock
    test_id = "transfer.diligence.submit.0"

    @client.transfer.diligence.submit(
      originator_client_id: "originator_client_id",
      originator_diligence: {
        dba: "dba",
        tax_id: "tax_id",
        address: {
          city: "city",
          street: "street",
          region: "region",
          postal_code: "postal_code",
          country_code: "country_code"
        },
        website: "website",
        naics_code: "naics_code",
        funding_account: {
          access_token: "access_token",
          account_id: "account_id"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.diligence.submit.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/diligence/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_diligence_submit_throws_bad_request_error_with_wiremock
    test_id = "transfer.diligence.submit.1"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.diligence.submit(
        originator_client_id: "originator_client_id",
        originator_diligence: {
          dba: "dba",
          tax_id: "x",
          address: {
            city: "city",
            street: "street",
            region: "region",
            postal_code: "postal_code",
            country_code: "country_code"
          },
          website: "website",
          naics_code: "banana",
          funding_account: {
            access_token: "access_token",
            account_id: "account_id"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.diligence.submit.1"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/diligence/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_diligence_submit_throws_unauthorized_error_with_wiremock
    test_id = "transfer.diligence.submit.2"

    error = assert_raises(Plaid::Errors::UnauthorizedError) do
      @client.transfer.diligence.submit(
        originator_client_id: "originator_client_id",
        originator_diligence: {
          dba: "dba",
          tax_id: "x",
          address: {
            city: "city",
            street: "street",
            region: "region",
            postal_code: "postal_code",
            country_code: "country_code"
          },
          website: "website",
          naics_code: "banana",
          funding_account: {
            access_token: "access_token",
            account_id: "account_id"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.diligence.submit.2"
          }
        }
      )
    end

    assert_equal 401, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/diligence/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_diligence_submit_throws_too_many_requests_error_with_wiremock
    test_id = "transfer.diligence.submit.3"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.diligence.submit(
        originator_client_id: "originator_client_id",
        originator_diligence: {
          dba: "dba",
          tax_id: "x",
          address: {
            city: "city",
            street: "street",
            region: "region",
            postal_code: "postal_code",
            country_code: "country_code"
          },
          website: "website",
          naics_code: "banana",
          funding_account: {
            access_token: "access_token",
            account_id: "account_id"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.diligence.submit.3"
          }
        }
      )
    end

    assert_equal 429, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/diligence/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_diligence_submit_throws_internal_server_error_with_wiremock
    test_id = "transfer.diligence.submit.4"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.diligence.submit(
        originator_client_id: "originator_client_id",
        originator_diligence: {
          dba: "dba",
          tax_id: "x",
          address: {
            city: "city",
            street: "street",
            region: "region",
            postal_code: "postal_code",
            country_code: "country_code"
          },
          website: "website",
          naics_code: "banana",
          funding_account: {
            access_token: "access_token",
            account_id: "account_id"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.diligence.submit.4"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/diligence/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_diligence_submit_throws_client_request_error_with_wiremock
    test_id = "transfer.diligence.submit.5"

    error = assert_raises(Plaid::Errors::ClientError) do
      @client.transfer.diligence.submit(
        originator_client_id: "originator_client_id",
        originator_diligence: {
          dba: "dba",
          tax_id: "x",
          address: {
            city: "city",
            street: "street",
            region: "region",
            postal_code: "postal_code",
            country_code: "country_code"
          },
          website: "website",
          naics_code: "banana",
          funding_account: {
            access_token: "access_token",
            account_id: "account_id"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.diligence.submit.5"
          }
        }
      )
    end

    assert_equal 400, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/diligence/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_diligence_submit_throws_server_error_with_wiremock
    test_id = "transfer.diligence.submit.6"

    error = assert_raises(Plaid::Errors::ServerError) do
      @client.transfer.diligence.submit(
        originator_client_id: "originator_client_id",
        originator_diligence: {
          dba: "dba",
          tax_id: "x",
          address: {
            city: "city",
            street: "street",
            region: "region",
            postal_code: "postal_code",
            country_code: "country_code"
          },
          website: "website",
          naics_code: "banana",
          funding_account: {
            access_token: "access_token",
            account_id: "account_id"
          }
        },
        request_options: {
          additional_headers: {
            "X-Test-Id" => "transfer.diligence.submit.6"
          }
        }
      )
    end

    assert_equal 500, error.code

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/diligence/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_diligence_upload_document_with_wiremock
    test_id = "transfer.diligence.upload_document.0"

    @client.transfer.diligence.upload_document(
      originator_client_id: "originator_client_id",
      file: __FILE__,
      purpose: "DUE_DILIGENCE",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "transfer.diligence.upload_document.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/transfer/diligence/document/upload",
      query_params: nil,
      expected: 1
    )
  end
end
