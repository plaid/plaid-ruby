require_relative 'test_helper'

# Internal: The test for Plaid::Institutions.
class PlaidInstitutionsTest < PlaidTest
  def test_get
    response = client.institutions.get(count: 3,
                                       offset: 1,
                                       country_codes: ['US'])
    assert_equal(3, response.institutions.length)
  end

  def test_get_with_options
    response = client.institutions.get count: 3,
                                       offset: 1,
                                       country_codes: ['US'],
                                       options: { products: ['transactions'],
                                                  include_optional_metadata:
                                                  true }
    assert_equal(3, response['institutions'].length)
  end

  def test_get_invalid_parameters
    assert_raises(Plaid::InvalidRequestError) do
      client.institutions.get(count: BAD_STRING,
                              offset: BAD_STRING,
                              country_codes: ['US'])
    end
  end

  def test_get_by_id
    response = client.institutions.get_by_id(SANDBOX_INSTITUTION, ['US'])
    assert_equal(SANDBOX_INSTITUTION, response.institution.institution_id)
    assert_equal(['US'], response.institution.country_codes)
  end

  def test_get_by_id_invalid_parameters
    assert_raises(Plaid::InvalidInputError) do
      client.institutions.get_by_id(BAD_STRING, ['US'])
    end
  end

  def test_get_by_id_include_optional_metadata
    response = client.institutions.get_by_id(SANDBOX_INSTITUTION,
                                             ['US'],
                                             options:
                                             { include_optional_metadata:
                                               true })
    assert_equal(SANDBOX_INSTITUTION, response.institution.institution_id)
  end

  def test_get_by_id_include_payment_initiation_metadata
    response = client.institutions.get_by_id(
      PAYMENT_INITIATION_METADATA_SANDBOX_INSTITUTION,
      ['GB'],
      options: { include_payment_initiation_metadata: true }
    )
    assert_equal(
      PAYMENT_INITIATION_METADATA_SANDBOX_INSTITUTION,
      response.institution.institution_id
    )
    refute_empty(response.institution.payment_initiation_metadata)
  end

  def test_get_by_id_include_status_false
    response = client.institutions.get_by_id(SANDBOX_INSTITUTION, ['US'])
    assert_equal(SANDBOX_INSTITUTION, response.institution.institution_id)
    assert_nil(response.institution.status)
  end

  def test_search
    response = client.institutions.search(SANDBOX_INSTITUTION_NAME, ['US'])
    refute_empty(response.institutions)
  end

  def test_search_with_include_optional_metadata
    response = client.institutions.search SANDBOX_INSTITUTION_NAME,
                                          ['US'],
                                          [:transactions],
                                          options:
                                          { include_optional_metadata: true }
    refute_empty(response.institutions)
  end

  def test_search_with_products
    response = client.institutions.search SANDBOX_INSTITUTION_NAME,
                                          ['US'],
                                          [:transactions]
    refute_empty(response.institutions)
  end

  def test_search_invalid_products
    assert_raises(Plaid::InvalidInputError) do
      client.institutions.search(SANDBOX_INSTITUTION_NAME,
                                 ['US'],
                                 BAD_ARRAY)
    end
  end

  def test_search_bad_products
    assert_raises(Plaid::InvalidInputError) do
      client.institutions.search(SANDBOX_INSTITUTION_NAME,
                                 ['US'],
                                 BAD_STRING)
    end
  end
end
