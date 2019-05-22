require_relative 'test_helper'

# Internal: The test for Plaid::Identity.
class PlaidIdentityTest < PlaidTest
  # rubocop:disable Metrics/AbcSize

  def test_get
    create_item initial_products: [:identity]

    response = client.identity.get(access_token)
    refute_empty(response.accounts)

    response.accounts.each do |account|
      refute_empty(account.owners)
      account.owners.each do |identity|
        refute_empty(identity.addresses)
        refute_empty(identity.emails)
        refute_empty(identity.names)
        refute_empty(identity.phone_numbers)
      end
    end
  end

  # rubocop:enable Metrics/AbcSize

  def test_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.identity.get(BAD_STRING)
    end
  end
end
