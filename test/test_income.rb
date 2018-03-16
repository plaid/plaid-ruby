require_relative 'test_helper'

# Internal: The test for Plaid::Income.
class PlaidIncomeTest < PlaidTest
  def setup
    create_item institution_id: 'ins_1', initial_products: [:income]
  end

  # FIXME: add a real income test

  def test_get
    assert_raises(Plaid::ItemError) do
      client.income.get(access_token)
    end
  end

  def test_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.income.get(BAD_STRING)
    end
  end
end
