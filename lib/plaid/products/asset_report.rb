module Plaid
  # Public: Class used to call the Assets product.
  class AssetReport < BaseProduct
    # Public: Get information about all available balances.
    #
    # Does a POST /accounts/balance/get call to get real-time balance
    # information for all accounts associated with the access_token's item.
    #
    # access_token - The String access_token for the item to fetch balances
    #                for.
    # account_ids  - The Array with specific account IDs to fetch balances for
    #                (optional).
    # options      - Additional options to be merged into the request
    #                (optional).
    #
    # Returns the AccountsResponse object with accounts information.
    def create(access_tokens, days_requested, options)
      post_with_auth 'asset_report/create',
                    AssetReportCreateResponse,
                    {
                      access_tokens: access_tokens,
                      days_requested: days_requested,
                      options: options,
                    }
    end

    def get(asset_report_token)
      post_with_auth 'asset_report/get',
                    AssetReportGetResponse,
                    {
                      asset_report_token: asset_report_token,
                    }
    end
  end

  # Public: The response wrapper for /asset_report/create.
  class AssetReportCreateResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The asset report token: String.
    property :asset_report_token

    ##
    # :attr_reader:
    # Public: The asset report ID: String.
    property :asset_report_id
  end

  # Public: The response wrapper for /asset_report/get.
  class AssetReportGetResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The asset report token: String.
    property :report, coerce: Models::AssetReport
  end
end
