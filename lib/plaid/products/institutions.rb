module Plaid
  # Public: Class used to call the Institutions product.
  class Institutions < BaseProduct
    # Public: Get information about Plaid institutions.
    #
    # Does a POST /institutions/get call pulls a list of supported Plaid
    # institutions with the information for each institution.
    #
    # count   - Amount of institutions to pull.
    # offset  - Offset to start pulling institutions.
    # options - Options for filtering institutions.
    #
    # Returns a MultipleInstitutionsResponse instance.
    def get(count:, offset:, country_codes:, options: nil)
      payload = { count: count,
                  offset: offset,
                  country_codes: country_codes
                }
      payload[:options] = options unless options.nil?

      post_with_auth 'institutions/get',
                     MultipleInstitutionsResponse,
                     payload
    end

    # Public: Get information about a Plaid institution by ID.
    #
    # Does a POST /institutions/get_by_id call which allows you to pull
    # information for an institution by ID.
    #
    # institution_id - Specific institution id to fetch information for.
    # options - Options for filtering institutions.
    #
    # Returns a SingleInstitutionResponse instance.
    def get_by_id(institution_id, country_codes, options: nil)
      payload = {
        institution_id: institution_id,
        country_codes: country_codes
      }
      payload[:options] = options unless options.nil?
      post_with_auth 'institutions/get_by_id',
                     SingleInstitutionResponse,
                     payload
    end

    # Public: Get information about all available institutions matching your
    # query.
    #
    # Does a POST /institutions/search call which allows you to pull a list of
    # institutions using a query parameter.
    #
    # query    - Search query to attempt to match institutions to.
    # products - Product supported filter (optional).
    # options - Options for filtering institutions.
    #
    # Returns a MultipleInstitutionsResponse instance.
    def search(query, products = nil, country_codes, options: nil)
      payload = {
        query: query,
        products: products,
        country_codes: country_codes
      }

      payload[:options] = options unless options.nil?

      post_with_auth 'institutions/search',
                     MultipleInstitutionsResponse,
                     payload
    end
  end

  # Public: Response for institutions search returning a single institution.
  class SingleInstitutionResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: Institution info: Plaid::Models::Institution.
    property :institution, coerce: Models::Institution
  end

  # Public: Response for institutions search returning multiple institutions.
  class MultipleInstitutionsResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: Institutions info: Array of Plaid::Models::Institution.
    property :institutions, coerce: Array[Models::Institution]

    ##
    # :attr_reader:
    # Public: The total number of search results.
    property :total
  end
end
