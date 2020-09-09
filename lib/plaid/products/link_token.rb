LINK_TOKEN_FIELD_NAMES = %i[
  user
  client_name
  products
  country_codes
  language
  webhook
  access_token
  link_customization_name
  redirect_uri
  android_package_name
  account_filters
  cross_app_item_add
  payment_initiation
].freeze

module Plaid
  # Public: Class used to call the LinkToken sub-product.
  class LinkToken < BaseProduct
    def create(configs)
      body = {}

      LINK_TOKEN_FIELD_NAMES.each do |field|
        body[field] = configs[field]
      end

      post_with_auth 'link/token/create',
                     CreateResponse,
                     body
    end

    def get(link_token)
      post_with_auth 'link/token/get',
                     GetResponse,
                     link_token: link_token
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

  # Public: Response for /link/token/get.
  class GetResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The String token.
    property :link_token

    ##
    # :attr_reader:
    # Public: The link token expiration time.
    property :expiration

    ##
    # :attr_reader:
    # Public: The link token created time.
    property :created_at

    ##
    # :attr_reader:
    # Public: The metadata associated with the link token.
    property :metadata, coerce: Models::LinkTokenMetadata
  end
end
