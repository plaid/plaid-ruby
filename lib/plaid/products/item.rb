module Plaid
  # Public: Class used to call the AccessToken sub-product.
  class AccessToken < BaseProduct
    # Public: Rotate your access_token, keeping it attached to the item
    #
    # Does a POST /item/access_token/invalidate call which will give you a new
    # access_token allowing you to rotate access_tokens.
    #
    # access_token - The String access_token to invalidate and rotate.
    #
    # Returns an InvalidateResponse object with the new access_token and
    # request id.
    def invalidate(access_token)
      post_with_auth 'item/access_token/invalidate',
                     InvalidateResponse,
                     access_token: access_token
    end

    # Public: Response for /item/access_token/invalidate.
    class InvalidateResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The String new access token.
      property :new_access_token
    end

    # Public: Generate a new API access_token for a legacy access_token
    #
    # Does a POST /item/access_token/update_version call which will give you
    # an access_token for the new API.
    #
    # access_token_v1 - legacy access_token
    #
    # Returns an UpdateVersionResponse object with new access_token and item
    # ID.
    def update_version(access_token_v1)
      post_with_auth 'item/access_token/update_version',
                     UpdateVersionResponse,
                     access_token_v1: access_token_v1
    end

    # Public: Response for /item/access_token/update_version.
    class UpdateVersionResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The String new access token for use.
      property :access_token

      ##
      # :attr_reader:
      # Public: The String item ID.
      property :item_id
    end
  end

  # Public: Class used to call the Credentials sub-product.
  class Credentials < BaseProduct
    # Public: Update credentials for an access_token.
    #
    # Does a POST /item/credentials/update call which is used to update
    # credentials if the credentials become no longer valid.
    #
    # access_token - access_token who's item to update credentials for
    # credentials  - New credentials
    #
    # Returns an UpdateResponse object with either an ItemStatus or MFA
    # response.
    def update(access_token, credentials)
      post_with_auth 'item/credentials/update',
                     UpdateResponse,
                     access_token: access_token,
                     credentials: credentials
    end

    # Public: Response for /item/credentials/update.
    class UpdateResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The item: Plaid::Models::Item.
      property :item, coerce: Models::Item
    end
  end

  # Public: Class used to call the PublicToken sub-product
  class PublicToken < BaseProduct
    # Public: Creates a public token from an access_token.
    #
    # Does a POST /item/public_token/create call which can be used to
    # initialize Link in update mode.
    #
    # access_token - access_token to create a public token for
    #
    # Returns a CreateResponse object with a public token and expiration info.
    def create(access_token)
      post_with_auth 'item/public_token/create',
                     CreateResponse,
                     access_token: access_token
    end

    # Public: Response for /item/public_token/create.
    class CreateResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The String token.
      property :public_token

      ##
      # :attr_reader:
      # Public: The String token expiration time.
      property :expiration
    end

    # Public: Exchange a public token for an access_token
    #
    # Does a POST /item/public_token/exchange call helps you exchange a public
    # token (possibly from Plaid Link) for an access_token you can use in the
    # rest of your app.
    #
    # public_token - The Public token to get an access_token from.
    #
    # Returns an ExchangeResponse object with an access_token and request id.
    def exchange(public_token)
      post_with_auth 'item/public_token/exchange',
                     ExchangeResponse,
                     public_token: public_token
    end

    # Public: Response for /item/public_token/exchange.
    class ExchangeResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The String access token for use with API.
      property :access_token

      ##
      # :attr_reader:
      # Public: The String item ID.
      property :item_id
    end
  end

  # Public: Class used to call the Webhook sub-product
  class Webhook < BaseProduct
    # Public: Update webhook for an access_token.
    #
    # Does a POST /item/webhook/update call which is used to update webhook
    # for a particular access_token. Webhooks are used to be notified when
    # transactions for an item are updated and ready.
    #
    # access_token - The access_token of an item to update webhook for.
    # webhook      - The new webhook link.
    #
    # Returns an UpdateResponse object with either an ItemStatus or MFA
    # response.
    def update(access_token, webhook)
      post_with_auth 'item/webhook/update',
                     UpdateResponse,
                     access_token: access_token,
                     webhook: webhook
    end

    # Public: Response for /item/webhook/update.
    class UpdateResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The item: Plaid::Models::Item.
      property :item, coerce: Models::Item
    end
  end

  # Public: Class used to call the Item product.
  class Item < BaseProduct
    ##
    # :attr_reader:
    # Public: The Plaid::AccessToken product accessor.
    subproduct :access_token

    ##
    # :attr_reader:
    # Public: The Plaid::Credentials product accessor.
    subproduct :credentials

    ##
    # :attr_reader:
    # Public: The Plaid::PublicToken product accessor.
    subproduct :public_token

    ##
    # :attr_reader:
    # Public: The Plaid::Webhook product accessor.
    subproduct :webhook

    # Public: Creates an item.
    #
    # Does a POST /item/create call which attemps to create a new item for you
    # possibly returning a success, error, or multi-factor authentication
    # response.
    #
    # credentials                - Institution credentials to create item with.
    # institution_id             - Institution ID to create item with.
    # initial_products           - Initial products to create the item with,
    #                              i.e. [:transactions].
    # transactions_start_date    - date at which to begin the item's initial
    #                              transaction pull (optional).
    # transactions_end_date      - date at which to end the item's initial
    #                              transaction pull (optional).
    # transactions_await_results - if true, the initial transaction pull will
    #                              be performed synchronously (optional).
    # webhook                    - webhook to associate with the item
    #                              (optional).
    # options                    - Additional options to merge into API
    #                              request.
    #
    # Returns an ItemResponse object with item info including access_token and
    # ItemStatus, or MFA response or error.
    def create(credentials:,
               institution_id:,
               initial_products:,
               transactions_start_date: nil,
               transactions_end_date: nil,
               transactions_await_results: nil,
               webhook: nil,
               options: nil)

      options_payload = {}

      txn_options = transaction_options transactions_start_date,
                                        transactions_end_date,
                                        transactions_await_results

      options_payload[:transactions] = txn_options if txn_options != {}
      options_payload[:webhook] = webhook unless webhook.nil?
      options_payload = options_payload.merge(options) unless options.nil?

      post_with_auth 'item/create',
                     ItemResponse,
                     credentials: credentials,
                     institution_id: institution_id,
                     initial_products: initial_products,
                     options: options_payload
    end

    private def transaction_options(start_date, end_date, await_results)
      {}.tap do |options|
        options[:start_date] = Plaid.convert_to_date_string(start_date) \
          if start_date

        options[:end_date] = Plaid.convert_to_date_string(end_date) \
          if end_date

        options[:await_results] = await_results if await_results
      end
    end

    # Public: Response for /item/create and /item/mfa endpoints.
    class ItemResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The String access_token to use with API.
      property :access_token

      ##
      # :attr_reader:
      # Public: The Plaid::Models::Item object, returned if item has been
      # successfully created.
      property :item, coerce: Models::Item

      ##
      # :attr_reader:
      # Public: The MFA/OTP device information: Plaid::Models::MFA::Device.
      property :device, coerce: Models::MFA::Device

      ##
      # :attr_reader:
      # Public: The list of devices to send the OTP to:
      # Array of Plaid::Models::MFA::DeviceListElement.
      property :device_list, coerce: Array[Models::MFA::DeviceListElement]

      ##
      # :attr_reader:
      # Public: The String MFA type. E.g. "device_list", "device", "questions",
      # "selections".
      property :mfa_type

      ##
      # :attr_reader:
      # Public: The Array of String MFA questions.
      property :questions

      ##
      # :attr_reader:
      # Public: The Array of MFA selections: Plaid::Models::MFA::Selection.
      property :selections, coerce: Array[Models::MFA::Selection]
    end

    # Public: Submit an MFA step.
    #
    # Does a POST /item/mfa call which gives you the ability to respond to an
    # MFA.
    #
    # access_token - To submit MFA step for.
    # mfa_type     - The MFA type indicated in the MFA response.
    # responses    - List of answers/responses to MFA.
    #
    # Returns an ItemResponse instance.
    def mfa(access_token, mfa_type, responses)
      post_with_auth 'item/mfa',
                     ItemResponse,
                     access_token: access_token,
                     mfa_type: mfa_type,
                     responses: responses
    end

    # Public: Get information about an item.
    #
    # Does a POST /item/get call which returns information about an item or
    # ItemStatus.
    #
    # access_token - access_token who's item to fetch status for
    #
    # Returns a GetResponse object with item information.
    def get(access_token)
      post_with_auth 'item/get',
                     GetResponse,
                     access_token: access_token
    end

    # Public: Response for /item/get.
    class GetResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The item: Plaid::Models::Item.
      property :item, coerce: Models::Item
    end

    # Public: Removes an item
    #
    # Does a POST /item/remove call which is used to remove an item
    #
    # access_token - access_token who's item to remove
    #
    # Returns a RemoveResponse object with remove result.
    def remove(access_token)
      post_with_auth 'item/remove',
                     RemoveResponse,
                     access_token: access_token
    end

    # Public: Response for /item/remove.
    class RemoveResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The Boolean flag meaning successful removal.
      property :removed
    end
  end
end
