require_relative 'test_helper'

# Internal: The test for Plaid::Institutions.
class PlaidInstitutionsTest < PlaidTest
  def test_get
    response = client.institutions.get(count: 3, offset: 1)
    assert_equal(3, response.institutions.length)
  end

  def test_get_with_options
    response = client.institutions.get count: 3,
                                       offset: 1,
                                       options: { products: ['transactions'],
                                                  include_optional_metadata:
                                                  true }
    assert_equal(3, response['institutions'].length)
  end

  def test_get_invalid_parameters
    assert_raises(Plaid::InvalidRequestError) do
      client.institutions.get(count: BAD_STRING, offset: BAD_STRING)
    end
  end

  def test_get_by_id
    response = client.institutions.get_by_id(SANDBOX_INSTITUTION)
    assert_equal(SANDBOX_INSTITUTION, response.institution.institution_id)
    assert_equal(['US'], response.institution.country_codes)
  end

  def test_get_by_id_invalid_parameters
    assert_raises(Plaid::InvalidInputError) do
      client.institutions.get_by_id(BAD_STRING)
    end
  end

  def test_get_by_id_include_optional_metadata
    response = client.institutions.get_by_id(SANDBOX_INSTITUTION,
                                             options:
                                             { include_optional_metadata:
                                               true })
    assert_equal(SANDBOX_INSTITUTION, response.institution.institution_id)
  end

  def test_get_by_id_include_status_false
    response = client.institutions.get_by_id(SANDBOX_INSTITUTION)
    assert_equal(SANDBOX_INSTITUTION, response.institution.institution_id)
    assert_nil(response.institution.status)
  end

  def test_get_by_id_include_status
    response = client.institutions.get_by_id(SANDBOX_INSTITUTION,
                                             options:
                                             { include_status: true })
    assert_equal(SANDBOX_INSTITUTION, response.institution.institution_id)
    refute_empty(response.institution.status)
  end

  def test_search
    response = client.institutions.search(SANDBOX_INSTITUTION_NAME)
    refute_empty(response.institutions)
  end

  def test_search_with_include_optional_metadata
    response = client.institutions.search SANDBOX_INSTITUTION_NAME,
                                          [:transactions],
                                          options:
                                          { include_optional_metadata: true }
    refute_empty(response.institutions)
  end

  def test_search_with_products
    response = client.institutions.search SANDBOX_INSTITUTION_NAME,
                                          [:transactions]
    refute_empty(response.institutions)
  end

  def test_search_invalid_products
    assert_raises(Plaid::InvalidInputError) do
      client.institutions.search(SANDBOX_INSTITUTION_NAME, BAD_ARRAY)
    end
  end

  def test_search_bad_products
    assert_raises(Plaid::InvalidInputError) do
      client.institutions.search(SANDBOX_INSTITUTION_NAME, BAD_STRING)
    end
  end
end
