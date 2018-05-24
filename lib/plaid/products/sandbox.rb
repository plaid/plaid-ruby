module Plaid
  # Public: Class used to call the SandboxItem sub-product.
  class SandboxItem < BaseProduct
    # Public: Resets sandbox item login.
    #
    # Does a POST /sandbox/item/reset_login call.
    #
    # access_token - access_token which item to reset login for.
    #
    # Returns a ResetLoginResponse object.
    def reset_login(access_token)
      post_with_auth 'sandbox/item/reset_login',
                     ResetLoginResponse,
                     access_token: access_token
    end

    # Public: Response for /sandbox/item/reset_login.
    class ResetLoginResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The Boolean reset success flag.
      property :reset_login
    end
  end

  # Public: Class used to call the SandboxPublicToken sub-product
  class SandboxPublicToken < BaseProduct
    # Public: Creates a public token for sandbox testing.
    #
    # Does a POST /sandbox/public_token/create call which can be used
    # to generate a public_token given an institution and list of
    # products.
    #
    # institution_id   - Specific institution id to generate token for.
    # initial_products - Products for which generated token is valid for.
    # webhook          - webhook to associate with the item (optional).
    # options          - Additional options to merge into API request.
    #
    # Returns a SandboxCreateResponse object with a public token and item id.
    def create(institution_id:,
               initial_products:,
               webhook: nil,
               options: nil)

      options_payload = {}
      options_payload[:webhook] = webhook unless webhook.nil?
      options_payload = options_payload.merge(options) unless options.nil?

      post_with_public_key 'sandbox/public_token/create',
                           SandboxCreateResponse,
                           institution_id: institution_id,
                           initial_products: initial_products,
                           options: options_payload
    end

    # Public: Response for /sandbox/public_token/create.
    class SandboxCreateResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The String token.
      property :public_token

      ##
      # :attr_reader:
      # Public: The String item ID.
      property :item_id
    end
  end

  # Public: Class used to call the Sandbox product.
  class Sandbox < BaseProduct
    ##
    # :attr_reader:
    # Public: The Plaid::SandboxItem product accessor.
    subproduct :sandbox_item

    ##
    # :attr_reader:
    # Public: The Plaid::SandboxPublicToken product accessor.
    subproduct :sandbox_public_token
  end
end
