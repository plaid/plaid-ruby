require_relative 'test_helper'

# Internal: The test for Plaid::Processor.
class PlaidProcessorTest < PlaidTest
  def setup
    create_item initial_products: [:auth]
  end

  def test_stripe_bank_account_token_create_invalid_account_id
    assert_raises(Plaid::InvalidRequestError) do
      client.processor.stripe.bank_account_token.create access_token,
                                                        BAD_STRING
    end
  end
end
