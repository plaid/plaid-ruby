module Plaid
  # Public: Class used to call the Institutions product.
  class Institutions
    def initialize(client)
      @client = client
    end

    # Public: Get information about Plaid institutions
    #
    # Does a POST /institutions/get call pulls a list of supported Plaid institutions
    # with the information for each institution
    #
    # count  - Amount of institutions to pull
    # offset - Offset to start pulling institutions
    #
    # Returns a parsed JSON of listed institution information
    def get(count:, offset:)
      payload = { count: count,
                  offset: offset }
      @client.post_with_auth('institutions/get', payload)
    end

    # Public: Get information about a Plaid institution by ID
    #
    # Does a POST /institutions/get_by_id call which allows you to pull
    # information for an institution by ID
    #
    # institution_id - Specific institution id to fetch information for
    #
    # Returns a parsed JSON of institution info for your institution id
    def get_by_id(institution_id)
      payload = { institution_id: institution_id }
      @client.post_with_public_key('institutions/get_by_id', payload)
    end

    # Public: Get information about all available institutions matching your query
    #
    # Does a POST /institutions/search call which allows you to pull a list of institutions
    # using a query parameter
    #
    # query   - Search query to attempt to match institutions to
    # producs - Product supported filter (optional)
    #
    # Returns a parsed JSON listing institution information
    def search(query, products = nil)
      payload = { query: query,
                  products: products }
      @client.post_with_public_key('institutions/search', payload)
    end
  end
end
