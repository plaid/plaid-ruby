module Plaid
  # Public: Class used to call the CreditDetails product.
  class CreditDetails
    def initialize(client)
      @client = client
    end

    # Public: Get information about all available credit_details
    #
    # Does a POST /credit_details/get call which fetches credit details associated with
    # and access_token's item
    #
    # access_token - access_token who's item to fetch credit_details for
    #
    # Returns a parsed JSON of credit_details information
    def get(access_token)
      payload = { access_token: access_token }
      @client.post_with_auth('credit_details/get', payload)
    end
  end
end
