module Plaid
  # Public: Class used to call the LinkToken sub-product.
  class LinkToken < BaseProduct
    def create(configs)
      post_with_auth 'link/token/create',
                     CreateResponse,
                     user: configs[:user],
                     client_name: configs[:client_name],
                     products: configs[:products],
                     country_codes: configs[:country_codes],
                     language: configs[:language],
                     locale: configs[:locale],
                     webhook: configs[:webhook],
                     access_token: configs[:access_token],
                     link_customization_name: configs[:link_configuration_name],
                     redirect_uri: configs[:redirect_uri],
                     android_package_name: configs[:android_package_name],
                     institution_id: configs[:institution_id],
                     account_filters: configs[:account_filters],
                     cross_app_item_add: configs[:cross_app_item_add],
                     payment_initiation: configs[:payment_initiation]
    end
  end

  # Public: Response for /link/token/create.
  class CreateResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The String token.
    property :token

    ##
    # :attr_reader:
    # Public: The String token expiration time.
    property :expiration
  end
end
