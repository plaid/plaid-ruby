module Plaid
  # Public: Class used to call the Income product.
  class Income
    def initialize(client)
      @client = client
    end

    # Public: Get information about user incomes
    #
    # Does a POST /income/get call which returns income info for an access_tokeni's item
    #
    # access_token - access_token who's item to fetch income for
    #
    # Returns a parsed JSON of income information
    def get(access_token)
      payload = { access_token: access_token }
      @client.post_with_auth('income/get', payload)
    end
  end
end
