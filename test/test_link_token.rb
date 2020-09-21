require_relative 'test_helper'

# Internal: The test for Plaid::Item.
class PlaidLinkTokenTest < PlaidTest
  def test_create_required
    link_token_response = client.link_token.create(
      user: { client_user_id: '123-fake-user-id' },
      client_name: 'Plaid Test',
      products: %w[auth transactions],
      country_codes: ['GB'],
      language: 'en'
    )
    refute_empty(link_token_response.link_token)
    refute_empty(link_token_response.expiration)
  end

  # rubocop:disable Metrics/MethodLength
  def test_create_optional
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
      products: %w[auth transactions],
      country_codes: ['GB'],
      language: 'en',
      webhook: 'https://sample-webhook.com',
      link_customization_name: 'default',
      account_filters: {
        depository: {
          account_subtypes: %w[checking savings]
        }
      }
    )
    refute_empty(link_token_response.link_token)
    refute_empty(link_token_response.expiration)
  end

  def test_create_and_get
    create_link_token_response = client.link_token.create(
      user: { client_user_id: '123-fake-user-id' },
      client_name: 'Plaid Test',
      products: %w[auth transactions],
      country_codes: ['GB'],
      language: 'en',
      webhook: 'https://sample-webhook.com',
      link_customization_name: 'default',
      account_filters: {
        depository: {
          account_subtypes: %w[checking savings]
        }
      }
    )
    refute_empty(create_link_token_response.link_token)
    refute_empty(create_link_token_response.expiration)

    get_link_token_response = client.link_token
                                    .get(create_link_token_response.link_token)
    refute_empty(get_link_token_response.link_token)
    refute_empty(get_link_token_response.expiration)
    assert_equal('Plaid Test', get_link_token_response.metadata.client_name)
    assert_equal(%w[auth transactions],
                 get_link_token_response.metadata.initial_products)
    assert_equal('en', get_link_token_response.metadata.language)
    assert_equal('https://sample-webhook.com',
                 get_link_token_response.metadata.webhook)
    assert_equal(['depository'],
                 get_link_token_response.metadata.account_filters.keys)
    assert_equal(['account_subtypes'],
                 get_link_token_response.metadata
.account_filters['depository'].keys)
    assert_equal(%w[checking savings],
                 get_link_token_response.metadata
.account_filters['depository']['account_subtypes'])
  end
  # rubocop:enable Metrics/MethodLength
end
