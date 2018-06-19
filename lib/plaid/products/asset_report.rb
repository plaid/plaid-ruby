module Plaid
  # Public: Class used to call the Assets product. Documentation available at
  # https://plaid.com/docs/api/#assets.
  class AssetReport < BaseProduct
    # Public: Create an asset report.
    #
    # access_tokens  - An array of access tokens, one token for each Item to be
    #                  included in the Asset Report.
    # days_requested - Days of transaction history requested to be included in
    #                  the Asset Report. Plaid will return as much data as
    #                  possible within the implied date range, up to a maximum
    #                  of 730 days (2 years) of history.
    # options -        An optional object containing client-provided user
    #                  information, a client-provided report ID, and a webhook.
    #                  For more information, see the website listed above.
    #
    # Returns a AssetReportCreateResponse object.
    def create(access_tokens, days_requested, options)
      post_with_auth 'asset_report/create',
                    AssetReportCreateResponse,
                    {
                      access_tokens: access_tokens,
                      days_requested: days_requested,
                      options: options,
                    }
    end

    # Public: Retrieve an asset report.
    #
    # asset_report_token - The asset report token from the `create` response.
    #
    # Returns a AssetReportGetResponse object.
    def get(asset_report_token)
      post_with_auth 'asset_report/get',
                    AssetReportGetResponse,
                    {
                      asset_report_token: asset_report_token,
                    }
    end

    # Public: Retrieve an asset report as a PDF.
    #
    # asset_report_token - The asset report token from the `create` response.
    #
    # Returns the PDF.
    def get_pdf(asset_report_token)
      client.post_with_auth('asset_report/pdf/get', {
        asset_report_token: asset_report_token,
      })
    end

    # Public: Remove an asset report.
    #
    # asset_report_token - The asset report token from the `create` response.
    #
    # Returns a AssetReportRemoveResponse object.
    def remove(asset_report_token)
      post_with_auth 'asset_report/remove',
                    AssetReportRemoveResponse,
                    {
                      asset_report_token: asset_report_token,
                    }
    end

    # Public: Create an audit copy token.
    #
    # asset_report_token - The asset report token from the `create` response.
    # auditor_id         - The ID of the third party with which you would like
    #                      to share the asset report.
    #
    # Returns a AuditCopyCreateResponse object.
    def create_audit_copy(asset_report_token, auditor_id)
      post_with_auth 'asset_report/audit_copy/create',
                    AuditCopyCreateResponse,
                    {
                      asset_report_token: asset_report_token,
                      auditor_id: auditor_id,
                    }
    end

    # Public: Remove an audit copy token.
    #
    # audit_copy_token - The audit copy token from the `create` response.
    #
    # Returns a AuditCopyRemoveResponse object.
    def remove_audit_copy(audit_copy_token)
      post_with_auth 'asset_report/audit_copy/remove',
                    AuditCopyRemoveResponse,
                    {
                      audit_copy_token: audit_copy_token,
                    }
    end
  end

  # Public: The response wrapper for /asset_report/create.
  class AssetReportCreateResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The asset report token.
    property :asset_report_token

    ##
    # :attr_reader:
    # Public: The asset report ID.
    property :asset_report_id
  end

  # Public: The response wrapper for /asset_report/get.
  class AssetReportGetResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The asset report token.
    property :report, coerce: Models::AssetReport

    ##
    # :attr_reader:
    # Public: Warnings encountered during asset report generation.
    property :warnings, coerce: Array[Models::Warning]
  end

  # Public: The response wrapper for /asset_report/remove.
  class AssetReportRemoveResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: A boolean indicating whether the report was removed.
    property :removed
  end

  # Public: The response wrapper for /audit_copy/create.
  class AuditCopyCreateResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The audit copy token.
    property :audit_copy_token
  end

  # Public: The response wrapper for /audit_copy/remove.
  class AuditCopyRemoveResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: A boolean indicating whether the audit copy was removed.
    property :removed
  end
end
