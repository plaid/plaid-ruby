require_relative 'plaid_test'

# Internal: The test for Plaid::Categories.
class PlaidCategoriesTest < PlaidTest
  def setup
    @client = create_client
  end

  def test_get
    response = @client.categories.get
    refute_empty(response)
  end
end
