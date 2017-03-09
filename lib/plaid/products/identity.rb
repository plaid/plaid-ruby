module Plaid
  # Public: Class used to call the Identity product.
  class Identity
    def initialize(client)
      @client = client
    end

    # Public: Get Identity information
    #
    # Does a POST /identity/get call to retrieve all info for a given access_token's item
    #
    # access_token - access_token who's item to fetch Identity data for
    #
    # Returns a parsed JSON of Identity information
    def get(access_token)
      payload = { access_token: access_token }
      @client.post_with_auth('identity/get', payload)
    end
  end
end
