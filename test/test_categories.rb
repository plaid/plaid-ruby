require_relative 'test_helper'

# Internal: The test for Plaid::CategoriesGet.
class PlaidCategoriesTest < PlaidTest
  def test_get
    response = client.categories_get({})
    assert_instance_of(Plaid::CategoriesGetResponse, response)
    refute_empty(response.to_hash)
  end
end