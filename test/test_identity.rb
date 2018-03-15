require_relative 'test_helper'

# Internal: The test for Plaid::Identity.
class PlaidIdentityTest < PlaidTest
  def test_get
    create_item initial_products: [:identity]

    response = client.identity.get(access_token)
    refute_empty(response.identity)
  end

  def test_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.identity.get(BAD_STRING)
    end
  end
end
