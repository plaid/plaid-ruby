module Plaid
  # Public: Class used to call the Categories product.
  class Categories
    def initialize(client)
      @client = client
    end

    # Public: Get information about all Plaid categories
    #
    # Does a POST /categories/get call to retrieve a list of all categories.
    #
    # Returns the CategoriesResponse object with a list of categories.
    def get
      CategoriesResponse.new(@client.post('categories/get', {}))
    end
  end

  # Public: Response wrapper for /categories/get.
  class CategoriesResponse < Models::BaseResponse
    property :categories, coerce: Array[Models::Category]
  end
end
