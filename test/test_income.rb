require_relative 'test_helper'

# Internal: The test for Plaid::Income.
class PlaidIncomeTest < PlaidTest
  def setup
    @item = @client.item.create(credentials: CREDENTIALS,
                                institution_id: 'ins_1',
                                initial_products: [:income])
    @access_token = @item['access_token']
  end

  def teardown
    @client.item.remove(@access_token)
  end

  def test_get
    assert_raises(Plaid::ItemError) do
      @client.income.get(@access_token)
    end
  end

  def test_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      @client.income.get(BAD_STRING)
    end
  end
end
