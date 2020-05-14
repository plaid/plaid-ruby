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

    # Public: Fires a webhook for a sandbox item
    #
    # Does a POST /sandbox/item/fire_webhook call.
    #
    # access_token - access_token of the item to fire a webhook for.
    # webhook_code - webhook_code to fire.
    #
    # Returns a FireWebhookResponse object.
    def fire_webhook(access_token, webhook_code)
      post_with_auth 'sandbox/item/fire_webhook',
                     FireWebhookResponse,
                     access_token: access_token,
                     webhook_code: webhook_code
    end

    # Public: Response for /sandbox/item/fire_webhook.
    class FireWebhookResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The Boolean webhook fired success flag.
      property :webhook_fired
    end

    # Public: Sets the verification status for an item
    # created via automated microdeposits
    #
    # Does a POST /sandbox/item/set_verification_status call.
    #
    # access_token - access_token of the item
    # account_id - id of the account to verify
    # verification_status - status to set
    #
    # Returns a Models::BaseResponse object.
    def set_verification_status(access_token, account_id, verification_status)
      post_with_auth '/sandbox/item/set_verification_status',
                     Models::BaseResponse,
                     access_token: access_token,
                     account_id: account_id,
                     verification_status: verification_status
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
               transactions_start_date: nil,
               transactions_end_date: nil,
               webhook: nil,
               options: nil)

      options_payload = {}
      options_payload[:webhook] = webhook unless webhook.nil?
      txn_options = transaction_options transactions_start_date,
                                        transactions_end_date
      options_payload[:transactions] = txn_options if txn_options != {}
      options_payload = options_payload.merge(options) unless options.nil?

      post_with_public_key 'sandbox/public_token/create',
                           SandboxCreateResponse,
                           institution_id: institution_id,
                           initial_products: initial_products,
                           options: options_payload
    end

    private def transaction_options(start_date, end_date)
      {}.tap do |options|
        options[:start_date] = Plaid.convert_to_date_string(start_date) \
          if start_date

        options[:end_date] = Plaid.convert_to_date_string(end_date) \
          if end_date
      end
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
