$link_token_field_names = [
   :user,
   :client_name,
   :products,
   :country_codes,
   :language,
   :webhook,
   :access_token,
   :link_customization_name,
   :redirect_uri,
   :android_package_name,
   :account_filters,
   :cross_app_item_add,
   :payment_initiation
]

module Plaid
  # Public: Class used to call the LinkToken sub-product.
  class LinkToken < BaseProduct
    def create(configs)
      body = {}

      for field in $link_token_field_names do
        body[field] = configs[field]
      end

      post_with_auth 'link/token/create',
                     CreateResponse,
                     body
    end
  end

  # Public: Response for /link/token/create.
  class CreateResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The String token.
    property :link_token

    ##
    # :attr_reader:
    # Public: The String token expiration time.
    property :expiration
  end
end
