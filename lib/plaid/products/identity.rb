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
    # Returns the IdentityResponse object with Identity info.
    def get(access_token)
      payload = { access_token: access_token }

      IdentityResponse.new(
        @client.post_with_auth('identity/get', payload))
    end
  end

  class IdentityResponse < Models::BaseResponse
    property :accounts, coerce: Array[Models::Account]
    property :identity, coerce: Models::Identity
    property :item, coerce: Models::Item
  end
end
