require_relative 'test_helper'

# rubocop:disable Metrics/AbcSize

# Internal: The test for Plaid::Auth.
class PlaidAuthTest < PlaidTest
  def setup
    create_item initial_products: [:auth]
  end

  def test_get
    response = client.auth.get(access_token)
    refute_empty(response.accounts)
    refute_empty(response.numbers)

    account_id = response.accounts[0].account_id
    response = client.auth.get(access_token, account_ids: [account_id])
    assert_equal 1, response.numbers.size

    response = client.auth.get(access_token,
                               options: { account_ids: [account_id] })
    assert_equal 1, response.numbers.size
  end

  def test_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.auth.get(BAD_STRING)
    end
  end

  def test_get_invalid_options
    assert_raises(Plaid::InvalidRequestError) do
      client.auth.get(access_token, account_ids: BAD_STRING)
    end
  end
end
