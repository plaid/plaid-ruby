require_relative 'plaid_test'

# Internal: The test for Plaid::Processor.
class PlaidProcessorTest < PlaidTest
  def setup
    @client = create_client
    @item = @client.item.create(credentials: CREDENTIALS,
                                institution_id: SANDBOX_INSTITUTION,
                                initial_products: [:auth])
    @access_token = @item['access_token']
  end

  def teardown
    @client.item.delete(@access_token)
  end

  def test_stripe_bank_account_token_create_invalid_account_id
    assert_raises(Plaid::InvalidRequestError) do
      @client.processor.stripe.bank_account_token.create(@access_token, BAD_STRING)
    end
  end
end
