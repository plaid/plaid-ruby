require_relative "test_helper"

# Internal: The test for Plaid::Institutions.
class PlaidInstitutionsTest < PlaidTest
  def test_get
    institutions_get_request = Plaid::InstitutionsGetRequest.new({
      :count => 3,
      :offset => 1,
      :country_codes => ["US"],
    })

    response = client.institutions_get(institutions_get_request)
    assert_equal(3, response.to_hash[:institutions].length)
  end

  def test_get_with_options
    institutions_get_request = Plaid::InstitutionsGetRequest.new({
      :count => 3,
      :offset => 1,
      :country_codes => ["US"],
      :options => {
        products: ["transactions"],
        include_optional_metadata: true,
      },
    })
    response = client.institutions_get institutions_get_request

    assert_kind_of(Plaid::InstitutionsGetResponse, response)
    assert_equal(3, response.institutions.length)
  end

  def test_get_invalid_parameters
    assert_raises(ArgumentError) do
      institutions_get_request = Plaid::InstitutionsGetRequest.new({
        :count => BAD_STRING,
        :offset => BAD_STRING,
        :country_codes => ["XX"],
      })
    end
  end

  def test_get_by_id
    institutions_get_by_id_request = Plaid::InstitutionsGetByIdRequest.new({
      :institution_id => SANDBOX_INSTITUTION,
      :country_codes => ["US"],
    })

    response = client.institutions_get_by_id(institutions_get_by_id_request)

    assert_equal(SANDBOX_INSTITUTION, response.institution.institution_id)
    assert_equal(["US"], response.institution.country_codes)
    assert_kind_of(Plaid::InstitutionsGetByIdResponse, response)
  end

  def test_get_by_id_invalid_parameters
    institutions_get_by_id_request = Plaid::InstitutionsGetByIdRequest.new({
      :institution_id => BAD_STRING,
      :country_codes => ["US"],
    })

    begin
      client.institutions_get_by_id institutions_get_by_id_request
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_INSTITUTION")
    end
  end

  def test_get_by_id_include_optional_metadata
    institutions_get_by_id_request = Plaid::InstitutionsGetByIdRequest.new({
      :institution_id => SANDBOX_INSTITUTION,
      :country_codes => ["US"],
      :options => { include_optional_metadata: true },
    })

    response = client.institutions_get_by_id(institutions_get_by_id_request)
    assert_equal(SANDBOX_INSTITUTION, response.institution.institution_id)
    assert_kind_of(Plaid::InstitutionsGetByIdResponse, response)
  end

  def test_get_by_id_include_status_false
    institutions_get_by_id_request = Plaid::InstitutionsGetByIdRequest.new({
      :institution_id => SANDBOX_INSTITUTION,
      :country_codes => ["US"],
    })

    response = client.institutions_get_by_id(institutions_get_by_id_request)
    assert_equal(SANDBOX_INSTITUTION, response.institution.institution_id)
    assert_nil(response.institution.status)
    assert_kind_of(Plaid::InstitutionsGetByIdResponse, response)
  end

  def test_search
    institutions_search_request = Plaid::InstitutionsSearchRequest.new({
      :query => SANDBOX_INSTITUTION_NAME,
      :products => [:transactions],
      :country_codes => ["US"],
    })

    response = client.institutions_search(institutions_search_request)
    refute_empty(response.institutions)
    assert_kind_of(Plaid::InstitutionsSearchResponse, response)
  end

  def test_search_with_include_optional_metadata
    institutions_search_request = Plaid::InstitutionsSearchRequest.new({
      :query => SANDBOX_INSTITUTION_NAME,
      :products => [:transactions],
      :country_codes => ["US"],
      :options => { include_optional_metadata: true },
    })

    response = client.institutions_search institutions_search_request
    refute_empty(response.institutions)
    assert_kind_of(Plaid::InstitutionsSearchResponse, response)
  end

  def test_search_with_products
    institutions_search_request = Plaid::InstitutionsSearchRequest.new({
      :query => SANDBOX_INSTITUTION_NAME,
      :products => [:transactions],
      :country_codes => ["US"],
    })

    response = client.institutions_search institutions_search_request
    refute_empty(response.institutions)
    assert_kind_of(Plaid::InstitutionsSearchResponse, response)
  end

  def test_search_invalid_products
    institutions_search_request = Plaid::InstitutionsSearchRequest.new({
      :query => SANDBOX_INSTITUTION_NAME,
      :products => BAD_ARRAY,
      :country_codes => ["XX"],
    })

    begin
      client.institutions_search institutions_search_request
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_PRODUCT")
    end
  end

  def test_search_bad_products
    institutions_search_request = Plaid::InstitutionsSearchRequest.new({
      :query => SANDBOX_INSTITUTION_NAME,
      :products => BAD_STRING,
      :country_codes => ["XX"],
    })

    begin
      client.institutions_search institutions_search_request
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_type"], "INVALID_REQUEST")
    end
  end
end
