module Plaid
  # Public: Class used to call the Balance product.
  class Balance < BaseProduct
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
    def get(access_token, account_ids: nil, options: nil)
      post_with_auth 'accounts/balance/get',
                     AccountsResponse,
                     build_payload(access_token,
                                   account_ids: account_ids,
                                   options: options)
    end
  end

  # Public: Class used to call the Accounts product.
  class Accounts < BaseProduct
    ##
    # Public: The Plaid::Balance product accessor.
    subproduct :balance

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
      post_with_auth 'accounts/get',
                     AccountsResponse,
                     build_payload(access_token,
                                   account_ids: account_ids,
                                   options: options)
    end
  end

  # Public: The response wrapper for /accounts/get and /accounts/balance/get.
  class AccountsResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The item: Plaid::Models::Item.
    property :item, coerce: Models::Item

    ##
    # :attr_reader:
    # Public: The list of accounts: Array of Plaid::Models::Account.
    property :accounts, coerce: Array[Models::Account]
  end
end
