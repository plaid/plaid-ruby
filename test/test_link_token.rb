require_relative 'test_helper'

# Internal: The test for Plaid::Item.
class PlaidItemTest < PlaidTest # rubocop:disable Metrics/ClassLength
  def test_link_token_create_required
    link_token_response = client.link_token.create(
      user: {
        client_user_id: '123-fake-user-id',
      },
      client_name: 'Plaid Test',
      products: ["auth", "transactions"],
    )
    refute_empty(link_token_response.token)
    refute_empty(link_token_response.expiration)
  end

  def test_link_token_create_optional
    link_token_response = client.link_token.create(
      user: {
        client_user_id: '123-fake-user-id',
        legal_name: 'John Doe',
        phone_number: '+1 415 555 0123',
        phone_number_verified_time: '2020-01-01T00:00:00Z',
        email_address: 'example@plaid.com',
        email_address_verified_time: '2020-01-01T00:00:00Z'
      },
      client_name: 'Plaid Test',
      products: ['auth', 'transactions'],
      country_codes: ['GB'],
      language: 'en',
      webhook: 'https://sample-webhook.com',
      link_customization_name: 'default',
      redirect_uri: 'https://sample-redirect-uri.com',
      account_filters: {
        depository: {
          account_subtypes: ['checking', 'savings'],
        }
      }
    )
    refute_empty(link_token_response.token)
    refute_empty(link_token_response.expiration)
  end
end
