require_relative 'test_helper'

# Internal: The test for Plaid::Accounts.
class PlaidAccountsTest < PlaidTest
  def setup
    @item = @client.item.create(credentials: CREDENTIALS,
                                institution_id: SANDBOX_INSTITUTION,
                                initial_products: [:transactions])
    @access_token = @item['access_token']
  end

  def teardown
    @client.item.remove(@access_token)
  end

  def test_get
    response = @client.accounts.get(@access_token)
    refute_empty(response)

    account_id = response['accounts'][0]['account_id']
    response = @client.accounts.get(@access_token, account_ids: [account_id])
    assert_equal(1, response['accounts'].length)

    response = @client.accounts.get(@access_token,
                                    options: { account_ids: [account_id] })
    assert_equal(1, response['accounts'].length)
  end

  def test_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      @client.accounts.get(BAD_STRING)
    end
  end

  def test_get_invalid_options
    assert_raises(Plaid::InvalidRequestError) do
      @client.accounts.get(@access_token, account_ids: BAD_STRING)
    end
  end

  def test_balance_get
    response = @client.accounts.balance.get(@access_token)
    refute_empty(response['accounts'])

    account_id = response['accounts'][0]['account_id']
    response = @client.accounts.balance.get(@access_token, account_ids: [account_id])
    assert_equal(1, response['accounts'].length)

    response = @client.accounts.balance.get(@access_token,
                                            options: { account_ids: [account_id] })
    assert_equal(1, response['accounts'].length)
  end

  def test_balance_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      @client.accounts.balance.get(BAD_STRING)
    end
  end

  def test_balance_get_invalid_options
    assert_raises(Plaid::InvalidRequestError) do
      @client.accounts.balance.get(@access_token, account_ids: BAD_STRING)
    end
  end
end
