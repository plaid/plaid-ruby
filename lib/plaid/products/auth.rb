module Plaid
  # Public: Class used to call the Auth product.
  class Auth
    def initialize(client)
      @client = client
    end

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
      options_payload = {}
      options_payload[:account_ids] = account_ids unless account_ids.nil?
      options_payload = options_payload.merge(options) unless options.nil?

      payload = { access_token: access_token,
                  options: options_payload }
      @client.post_with_auth('auth/get', payload)
    end
  end
end
