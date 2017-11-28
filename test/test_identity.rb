require_relative 'test_helper'

# Internal: The test for Plaid::Identity.
class PlaidIdentityTest < PlaidTest
  def setup
    @item = @client.item.create(credentials: CREDENTIALS,
                                institution_id: SANDBOX_INSTITUTION,
                                initial_products: [:identity])
    @access_token = @item['access_token']
  end

  def teardown
    @client.item.remove(@access_token)
  end

  def test_get
    response = @client.identity.get(@access_token)
    refute_empty(response['identity'])
  end

  def test_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      @client.identity.get(BAD_STRING)
    end
  end
end
