require_relative "test_helper"

# Internal: The test for Plaid::AssetReport.
class PlaidAssetReportTest < PlaidTest
  def test_full_flow # rubocop:disable Metrics/MethodLength
    # Create an item with the "assets" product.
    create_item initial_products: [:assets]

    # Create an asset report.
    days_requested = 60
    options = {
      client_report_id: "123",
      webhook: "https://www.example.com",
      user: {
        client_user_id: "789",
        first_name: "Jane",
        middle_name: "Leah",
        last_name: "Doe",
        ssn: "123-45-6789",
        phone_number: "(555) 123-4567",
        email: "jane.doe@example.com",
      },
    }
    asset_report_create_request = Plaid::AssetReportCreateRequest.new
    asset_report_create_request.access_tokens = [access_token]
    asset_report_create_request.days_requested = days_requested
    asset_report_create_request.options = options

    response = client.asset_report_create(asset_report_create_request)

    refute_empty(response.asset_report_id)
    refute_empty(response.asset_report_token)
    asset_report_token = response.asset_report_token
    assert_kind_of(Plaid::AssetReportCreateResponse, response)

    # Poll until report generation has finished.
    response = poll_for_asset_report(asset_report_token)
    refute_empty(response.report.to_hash)
    assert_kind_of(Plaid::AssetReportGetResponse, response)

    # Retrieve the report as an Asset Report with Insights.
    asset_report_get_request = Plaid::AssetReportGetRequest.new
    asset_report_get_request.asset_report_token = asset_report_token
    asset_report_get_request.include_insights = true

    response = client.asset_report_get(asset_report_get_request)

    refute_empty(response.report.to_hash)
    assert_kind_of(Plaid::AssetReportGetResponse, response)

    # Get the asset report as a PDF in a tempfile.
    asset_report_pdf_get_request = Plaid::AssetReportPDFGetRequest.new
    asset_report_pdf_get_request.asset_report_token = asset_report_token

    pdf = client.asset_report_pdf_get(asset_report_pdf_get_request)
    refute_empty(pdf.path)
    assert_kind_of(Tempfile, pdf)

    # Test opening pdf contents
    # require 'fileutils'
    # FileUtils.mv(pdf.path, "test.pdf")

    # # Create a filtered copy of the report.
    account_ids_to_exclude = [response.report.items[0].accounts[0].account_id]
    asset_report_filter_request = Plaid::AssetReportFilterRequest.new
    asset_report_filter_request.asset_report_token = asset_report_token
    asset_report_filter_request.account_ids_to_exclude = account_ids_to_exclude

    response = client.asset_report_filter(
      asset_report_filter_request
    )
    refute_empty(response.asset_report_token)
    assert_kind_of(Plaid::AssetReportFilterResponse, response)

    response = poll_for_asset_report(asset_report_token)
    refute_empty(response.report.to_hash)
    assert_kind_of(Plaid::AssetReportGetResponse, response)

    # Create refreshed copy of the report.
    asset_report_refresh_request = Plaid::AssetReportRefreshRequest.new
    asset_report_refresh_request.asset_report_token = asset_report_token
    asset_report_refresh_request.days_requested = 10

    response = client.asset_report_refresh(asset_report_refresh_request)
    refute_empty(response.asset_report_token)
    assert_kind_of(Plaid::AssetReportRefreshResponse, response)

    response = poll_for_asset_report(response.asset_report_token)
    refute_empty(response.report.to_hash)
    assert_kind_of(Plaid::AssetReportGetResponse, response)

    # Create an audit copy token.
    asset_report_audit_copy_create_request = Plaid::AssetReportAuditCopyCreateRequest.new
    asset_report_audit_copy_create_request.asset_report_token = asset_report_token
    asset_report_audit_copy_create_request.auditor_id = @client_id

    response = client.asset_report_audit_copy_create(
      asset_report_audit_copy_create_request
    )
    audit_copy_token = response.audit_copy_token
    refute_empty(audit_copy_token)
    assert_kind_of(Plaid::AssetReportAuditCopyCreateResponse, response)

    # Get the audit copy.
    asset_report_audit_copy_get_request = Plaid:: AssetReportAuditCopyGetRequest.new
    asset_report_audit_copy_get_request.audit_copy_token = audit_copy_token

    response = @client.asset_report_audit_copy_get(asset_report_audit_copy_get_request)
    refute_empty(response.report.to_hash)
    assert_kind_of(Plaid::AssetReportGetResponse, response)

    # Remove the audit copy.
    asset_report_audit_copy_remove_request = Plaid::AssetReportAuditCopyRemoveRequest.new
    asset_report_audit_copy_remove_request.audit_copy_token = audit_copy_token

    response = @client.asset_report_audit_copy_remove(asset_report_audit_copy_remove_request)
    assert_equal(response.removed, true)
    assert_kind_of(Plaid::AssetReportAuditCopyRemoveResponse, response)

    # Remove the asset report.
    asset_report_remove_request = Plaid::AssetReportRemoveRequest.new
    asset_report_remove_request.asset_report_token = asset_report_token

    response = @client.asset_report_remove(asset_report_remove_request)
    assert_equal(response.removed, true)
    assert_kind_of(Plaid::AssetReportRemoveResponse, response)
  end
end

def poll_for_asset_report(asset_report_token)
  response = nil
  50.times do
    begin
      asset_report_get_request = Plaid::AssetReportGetRequest.new
      asset_report_get_request.asset_report_token = asset_report_token

      response = @client.asset_report_get(asset_report_get_request)
      break
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      raise e if json_response["error_code"] != "PRODUCT_NOT_READY"
      sleep 1
    end
  end
  assert response, "Timed out while waiting for asset report generation"
  response
end