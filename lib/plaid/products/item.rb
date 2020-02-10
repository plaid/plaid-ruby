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
    # Public: The Plaid::PublicToken product accessor.
    subproduct :public_token

    ##
    # :attr_reader:
    # Public: The Plaid::Webhook product accessor.
    subproduct :webhook

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

      ##
      # :attr_reader:
      # Public: The item status: Plaid::Models::ItemStatus.
      property :status, coerce: Models::ItemStatus
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

    # Public: Import an item.
    #
    # Does a POST /item/import call which imports an item.
    #
    # products - array of products to enable
    # user_auth - hash map of user authentication information
    # options - optional hash map of options
    #
    # Returns an access token for the item.
    def import(products, user_auth, options)
      post_with_auth 'item/import',
                     ImportResponse,
                     products: products,
                     user_auth: user_auth,
                     options: options
    end

    # Public: Response for /item/import.
    class ImportResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The access token string
      property :access_token
    end
  end
end
