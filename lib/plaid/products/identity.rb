module Plaid
  # Public: Class used to call the Identity product.
  class Identity < BaseProduct
    # Public: Get Identity information.
    #
    # Does a POST /identity/get call to retrieve all info for a given
    # access_token's item.
    #
    # access_token - access_token who's item to fetch Identity data for.
    #
    # Returns the IdentityResponse object with Identity info.
    def get(access_token)
      post_with_auth 'identity/get',
                     IdentityResponse,
                     access_token: access_token
    end
  end

  # Public: Response for /identity/get.
  class IdentityResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The list of accounts: Array of Plaid::Models::Account.
    property :accounts, coerce: Array[Models::Account]

    ##
    # :attr_reader:
    # Public: Identity information: Plaid::Models::Identity.
    property :identity, coerce: Models::Identity

    ##
    # :attr_reader:
    # Public: The item: Plaid::Models::Item.
    property :item, coerce: Models::Item
  end
end
