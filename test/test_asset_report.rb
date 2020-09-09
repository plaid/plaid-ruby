require_relative 'test_helper'

# Internal: The test for Plaid::AssetReport.
class PlaidAssetReportTest < PlaidTest
  def test_full_flow # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
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
        email: 'jane.doe@example.com'
      }
    }
    response = @client.asset_report.create(
      [access_token], days_requested, options
    )
    refute_empty(response.asset_report_id)
    refute_empty(response.asset_report_token)
    asset_report_token = response.asset_report_token

    # Poll until report generation has finished.
    response = poll_for_asset_report(asset_report_token)
    refute_empty(response.report)

    # Retrieve the report as an Asset Report with Insights.
    response = @client.asset_report.get(
      asset_report_token,
      include_insights: true
    )
    refute_empty(response.report)

    # Get the asset report as a PDF.
    pdf = @client.asset_report.get_pdf(asset_report_token)
    refute_empty(pdf)

    # Create a filtered copy of the report.
    account_ids_to_exclude =
      [response.report.items[0].accounts[0].account_id]
    response = @client.asset_report.filter(
      asset_report_token,
      account_ids_to_exclude
    )
    refute_empty(response.asset_report_token)
    response = poll_for_asset_report(response.asset_report_token)
    refute_empty(response.report)

    # Create refreshed copy of the report.
    response = @client.asset_report.refresh(asset_report_token, 10, {})
    refute_empty(response.asset_report_token)
    response = poll_for_asset_report(response.asset_report_token)
    refute_empty(response.report)

    # Create an audit copy token.
    response = @client.asset_report.create_audit_copy(
      asset_report_token,
      @client.client_id
    )
    audit_copy_token = response.audit_copy_token
    refute_empty(audit_copy_token)

    # Get the audit copy.
    response = @client.asset_report.get_audit_copy(audit_copy_token)
    refute_empty(response.report)

    # Remove the audit copy.
    response = @client.asset_report.remove_audit_copy(audit_copy_token)
    assert_equal(response.removed, true)

    # Remove the asset report.
    response = @client.asset_report.remove(asset_report_token)
    assert_equal(response.removed, true)
  end
end

def poll_for_asset_report(asset_report_token)
  response = nil
  50.times do
    begin
      response = @client.asset_report.get(asset_report_token)
      break
    rescue Plaid::PlaidAPIError => e
      raise e if e.error_code != 'PRODUCT_NOT_READY'
      sleep 1
    end
  end
  assert response, 'Timed out while waiting for asset report generation'
  response
end
