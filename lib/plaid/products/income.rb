module Plaid
  # Public: Class used to call the Income product.
  class Income < BaseProduct
    # Public: Get information about user incomes.
    #
    # Does a POST /income/get call which returns income info for an
    # access_token's item.
    #
    # access_token - access_token whose item to fetch income for.
    #
    # Returns the IncomeResponse object with Income info.
    def get(access_token)
      post_with_auth 'income/get',
                     IncomeResponse,
                     access_token: access_token
    end
  end

  # Public: Income product response.
  class IncomeResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The item: Plaid::Models::Item.
    property :item, coerce: Models::Item

    ##
    # :attr_reader:
    # Public: Income information: Plaid::Models::Income.
    property :income, coerce: Models::Income
  end
end
