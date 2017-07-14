module Plaid
  # Public: Class used to call the Balance product.
  class Balance < BaseProduct
    # Public: Get information about all available balances.
    #
    # Does a POST /accounts/balance/get call to get real-time balance information for all
    # accounts associated with the access_token's item.
    #
    # access_token - The String access_token for the item to fetch balances for.
    # account_ids  - The Array with specific account IDs to fetch balances for (optional).
    # options      - Additional options to be merged into the request (optional).
    #
    # Returns the AccountsResponse object with accounts information.
    def get(access_token, account_ids: nil, options: nil)
      payload = build_payload(access_token,
                              account_ids: account_ids, options: options)

      AccountsResponse.new(
        client.post_with_auth('accounts/balance/get', payload))
    end
  end

  # Public: Class used to call the Accounts product.
  class Accounts < BaseProduct
    ##
    # Public: The Plaid::Balance product accessor.
    subproduct :balance, Plaid::Balance

    # Public: Get information about all available accounts.
    #
    # Does a POST /accounts/get call to retrieve high level account information
    # associated with an access_token's item
    #
    # access_token - access_token who's item to fetch accounts for
    # account_ids  - Specific account ids to fetch accounts for (optional)
    # options      - Additional options to be merged into API request
    #
    # Returns the AccountsResponse object with accounts information.
    def get(access_token, account_ids: nil, options: nil)
      payload = build_payload(access_token,
                              account_ids: account_ids, options: options)

      AccountsResponse.new(
        client.post_with_auth('accounts/get', payload))
    end
  end

  # Public: The response wrapper for /accounts/get and /accounts/balance/get.
  class AccountsResponse < Models::BaseResponse
    property :item, coerce: Models::Item
    property :accounts, coerce: Array[Models::Account]
  end
end
