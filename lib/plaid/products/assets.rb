module Plaid
  # Public: Class used to call the Assets product.
  class Assets < BaseProduct
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
    def create(access_tokens, days_requested, options: {})
      post_with_auth 'asset_report/create',
                    AccountsResponse,
                    {
                      access_tokens: access_tokens,
                      days_requested: days_requested,
                      options: options,
                    }
    end
  end

  # Public: The response wrapper for /asset_report/get.
  class AssetsCreateResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The asset report token: String.
    property :asset_report_token

    ##
    # :attr_reader:
    # Public: The asset report ID: String.
    property :asset_report_id
  end
end
