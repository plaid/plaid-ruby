require_relative 'test_helper'

# Internal: The test for Plaid::Categories.
class PlaidCategoriesTest < PlaidTest
  def test_get
    response = client.categories.get
    refute_empty(response)
  end
end
