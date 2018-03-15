require_relative 'test_helper'

# Internal: The test for Plaid::Processor.
class PlaidProcessorTest < PlaidTest
  def setup
    @item = @client.item.create(credentials: CREDENTIALS,
                                institution_id: SANDBOX_INSTITUTION,
                                initial_products: [:auth])
    @access_token = @item['access_token']
  end

  def teardown
    @client.item.remove(@access_token)
  end

  def test_stripe_bank_account_token_create_invalid_account_id
    assert_raises(Plaid::InvalidRequestError) do
      @client.processor.stripe.bank_account_token.create(@access_token, BAD_STRING)
    end
  end
end
