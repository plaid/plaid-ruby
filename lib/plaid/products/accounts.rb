module Plaid
  # Public: Class used to call the Balance product.
  class Balance
    def initialize(client)
      @client = client
    end

    # Public: Get information about all available balances.
    #
    # Does a POST /accounts/balance/get call to get real-time balance information for all
    # accounts associated with the access_token's item
    #
    # access_token - The String access_token for the item to fetch balances for.
    # account_ids  - Specific account IDs to fetch balances for (optional).
    # options      - Additional options to be merged into the request.
    #
    # Returns the AccountsResponse object with accounts information.
    def get(access_token, account_ids: nil, options: nil)
      options_payload = {}
      options_payload[:account_ids] = account_ids unless account_ids.nil?
      options && options_payload.merge!(options)

      payload = { access_token: access_token,
                  options: options_payload }

      AccountsResponse.new(
        @client.post_with_auth('accounts/balance/get', payload))
    end
  end

  # Public: Class used to call the Accounts product.
  class Accounts
    # Public: Memoized class instance to make requests from Plaid::Balance.
    def balance
      @balance ||= Plaid::Balance.new(@client)
    end

    def initialize(client)
      @client = client
    end

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
      options_payload = {}
      options_payload[:account_ids] = account_ids unless account_ids.nil?
      options_payload = options_payload.merge(options) unless options.nil?

      payload = { access_token: access_token,
                  options: options_payload }

      AccountsResponse.new(
        @client.post_with_auth('accounts/get', payload))
    end
  end

  # Public: The response wrapper for /accounts/get and /accounts/balance/get.
  class AccountsResponse < Models::BaseResponse
    property :item, coerce: Models::Item
    property :accounts, coerce: Array[Models::Account]
  end
end
