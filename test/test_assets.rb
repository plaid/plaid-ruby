require_relative 'test_helper'

# Internal: The test for Plaid::AssetReport.
class PlaidAssetsTest < PlaidTest
  def setup
    create_item initial_products: [:assets]
  end

  # rubocop:disable Metrics/AbcSize

  def test_full_flow
    days_requested = 60
    options = {
      client_report_id: '123',
      webhook: 'https://www.example.com',
      user: {
        client_user_id: '789',
        first_name: 'Jane',
        middle_name: 'Leah',
        last_name: 'Doe',
        ssn: '123-45-6789',
        phone_number: '(555) 123-4567',
        email: 'jane.doe@example.com',
      },
    }

    # `access_tokens` is a list of Item access tokens. Note that the `assets`
    # product must be enabled for all Items. All fields on the `options` Hash
    # are optional.
    response = @client.asset_report.create([@access_token], days_requested, options)
    refute_empty(response.asset_report_id)
    refute_empty(response.asset_report_token)
  end
end
