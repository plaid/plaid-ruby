require_relative 'test_helper'

# Internal: The test for Plaid::AssetReport.
class PlaidAssetReportTest < PlaidTest

  # rubocop:disable Metrics/AbcSize

  def test_full_flow
    # Create an item with the "assets" product.
    create_item initial_products: [:assets]

    # Create an asset report.
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
    response = @client.asset_report.create([access_token], days_requested, options)
    refute_empty(response.asset_report_id)
    refute_empty(response.asset_report_token)

    # Poll until report generation has finished.
    asset_report_token = response.asset_report_token
    retries = 20
    while
      begin
        response = @client.asset_report.get(asset_report_token)
        break
      rescue Plaid::PlaidAPIError => e
        if e.error_code == 'PRODUCT_NOT_READY'
          if retries == 0
            raise 'Timed out while waiting for asset report generation'
          else
            sleep 1
          end
        else
          raise e
        end
      end
    end
    refute_empty(response.report)

    # Get the asset report as a PDF.
    pdf = @client.asset_report.get_pdf(asset_report_token)
    refute_empty(pdf)

    # Create an audit copy token.
    response = @client.asset_report.create_audit_copy(
      asset_report_token, 'fannie_mae')
    refute_empty(response.audit_copy_token)

    # Remove the audit copy.
    response = @client.asset_report.remove_audit_copy(response.audit_copy_token)
    assert_equal(response.removed, true)

    # Remove the asset report.
    response = @client.asset_report.remove(asset_report_token)
    assert_equal(response.removed, true)
  end
end
