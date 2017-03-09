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
    # Returns a parsed JSON of a list of categories
    def get
      payload = {}
      @client.post('categories/get', payload)
    end
  end
end
