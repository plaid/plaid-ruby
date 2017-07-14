module Plaid
  # Public: Class used to call the Auth product.
  class Auth < BaseProduct
    # Public: Get information about account and routing numbers for checking
    # and savings accounts
    #
    # Does a POST /auth/get call which returns high level account information along with
    # account and routing numbers for checking and savings accounts
    #
    # access_token - access_token who's item to fetch Auth for
    # account_ids  - Specific account ids to fetch numbers for (optional)
    # options      - Additional options to merge into API request
    #
    # Returns a parsed JSON of Auth information
    def get(access_token, account_ids: nil, options: nil)
      payload = build_payload(access_token,
                              account_ids: account_ids, options: options)

      AuthResponse.new(client.post_with_auth('auth/get', payload))
    end
  end

  # Public: Response wrapper for /accounts/get and /accounts/balance/get
  class AuthResponse < Models::BaseResponse
    property :accounts, coerce: Array[Models::Account]
    property :numbers, coerce: Array[Models::Number]
    property :item, coerce: Models::Item
  end
end
