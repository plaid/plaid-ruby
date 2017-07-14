module Plaid
  # Public: Class used to call the Income product.
  class Income < BaseProduct
    # Public: Get information about user incomes
    #
    # Does a POST /income/get call which returns income info for an access_tokeni's item
    #
    # access_token - access_token whose item to fetch income for.
    #
    # Returns the IdentityResponse object with Income info.
    def get(access_token)
      payload = { access_token: access_token }

      IncomeResponse.new(client.post_with_auth('income/get', payload))
    end
  end

  class IncomeResponse < Models::BaseResponse
    property :item, coerce: Models::Item
    property :income, coerce: Models::Income
  end
end
