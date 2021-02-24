require_relative 'test_helper'

# Internal: The test for Plaid::CreditDetails.
class PlaidCreditDetailsTest < PlaidTest
  def setup
    create_item initial_products: [:credit_details]
  end

  def test_get
    assert_raises(Plaid::InvalidRequestError) do
      client.credit_details.get(access_token)
    end
  end

  def test_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.credit_details.get(BAD_STRING)
    end
  end

  def test_get_invalid_options
    assert_raises(Plaid::InvalidRequestError) do
      client.credit_details.get(access_token, account_ids: BAD_STRING)
    end
  end
end
