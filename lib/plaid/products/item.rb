module Plaid
  # Public: Class used to call the AccessToken sub-product.
  class AccessToken
    def initialize(client)
      @client = client
    end

    # Public: Rotate your access_token, keeping it attached to the item
    #
    # Does a POST /item/access_token/invalidate call which will give you a new access_token
    # allowing you to rotate access_tokens
    #
    # access_token - access_token to invalidate and rotate
    #
    # Returns a parsed JSON with the new access_token and request id
    def invalidate(access_token)
      payload = { access_token: access_token }
      @client.post_with_auth('item/access_token/invalidate', payload)
    end

    # Public: Generate a new API access_token for a legacy access_token
    #
    # Does a POST /item/access_token/update_version call which will give you
    # an access_token for the new API.
    #
    # access_token_v1 - legacy access_token
    #
    # Returns a parsed JSON with the new access_token and request id
    def update_version(access_token_v1)
      payload = { access_token_v1: access_token_v1 }
      @client.post_with_auth('item/access_token/update_version', payload)
    end
  end

  # Public: Class used to call the Credentials sub-product.
  class Credentials
    def initialize(client)
      @client = client
    end

    # Public: Update credentials for an access_token.
    #
    # Does a POST /item/credentials/update call which is used to update credentials
    # if the credentials become no longer valid
    #
    # access_token - access_token who's item to update credentials for
    # credentials  - New credentials
    #
    # Returns a parsed JSON of either an ItemStatus or MFA response
    def update(access_token, credentials)
      payload = { access_token: access_token,
                  credentials: credentials }
      @client.post_with_auth('item/credentials/update', payload)
    end
  end

  # Public: Class used to call the PublicToken sub-product
  class PublicToken
    def initialize(client)
      @client = client
    end

    # Public: Creates a public token from an access_token.
    #
    # Does a POST /item/public_token/create call which can be used to initialize Link
    # in update mode
    #
    # access_token - access_token to create a public token for
    #
    # Returns a parsed JSON containing a public token and token info
    def create(access_token)
      payload = { access_token: access_token }
      @client.post_with_auth('item/public_token/create', payload)
    end

    # Public: Exchange a public token for an access_token
    #
    # Does a POST /item/public_token/exchange call helps you exchange a public token
    # (possibly from Plaid Link) for an access_token you can use in the rest of your app
    #
    # public_token - Public token to get an access_token from
    #
    # Returns a parsed JSON with an access_token and request id
    def exchange(public_token)
      payload = { public_token: public_token }
      @client.post_with_auth('item/public_token/exchange', payload)
    end
  end

  # Public: Class used to call the Webhook sub-product
  class Webhook
    def initialize(client)
      @client = client
    end

    # Public: Update webhook for an access_token
    #
    # Does a POST /item/webhook/update call which is used to update webhook
    # for a particular access_token, webhooks are used to be notified when
    # transactions for an item are updated and ready
    #
    # access_token - access_token who's item to update webhood for
    # webhook      - a new webhook link
    #
    # Returns a parsed JSON of either an ItemStatus or MFA response
    def update(access_token, webhook)
      payload = { access_token: access_token,
                  webhook: webhook }
      @client.post_with_auth('item/webhook/update', payload)
    end
  end

  # Public: Class used to call the Item product.
  class Item
    # Public: Memoized class instance to make requests from Plaid::AccessToken
    def access_token
      @access_token ||= Plaid::AccessToken.new(@client)
    end

    # Public: Memoized class instance to make requests from Plaid::Credentials
    def credentials
      @credentials ||= Plaid::Credentials.new(@client)
    end

    # Public: Memoized class instance to make requests from Plaid::PublicToken
    def public_token
      @public_token ||= Plaid::PublicToken.new(@client)
    end

    # Public: Memoized class instance to make requests from Plaid::Webhook
    def webhook
      @webhook ||= Plaid::Webhook.new(@client)
    end

    def initialize(client)
      @client = client
    end

    # Public: Creates an item.
    #
    # Does a POST /item/create call which attemps to create a new item for you
    # possibly returning a success, error, or multi-factor authentication response
    #
    # credentials                 - Institution credentials to create item with
    # institution_id              - Institution ID to create item with
    # initial_products            - Initial products to create the item with i.e. ['transactions']
    # transactions_start_date     - date at which to begin the item's initial transaction pull
    #                              (optional)
    # transactions_end_date       - date at which to end the item's initial transaction pull
    #                              (optional)
    # transactions_await_results  - if true, the initial transaction pull will be performed
    #                              synchronously (optional)
    # webhook                     - webhook to associate with the item (optional)
    # options                     - Additional options to merge into API request
    #
    # Returns a parsed JSON of item info including access_token and ItemStatus or
    # MFA response or error
    def create(credentials:,
               institution_id:,
               initial_products:,
               transactions_start_date: nil,
               transactions_end_date: nil,
               transactions_await_results: nil,
               webhook: nil,
               options: nil)

      transactions_options = {}
      unless transactions_start_date.nil?
        transactions_options[:start_date] = Plaid.convert_to_date_string(transactions_start_date)
      end
      unless transactions_end_date.nil?
        transactions_options[:end_date] = Plaid.convert_to_date_string(transactions_end_date)
      end
      unless transactions_await_results.nil?
        transactions_options[:await_results] = transactions_await_results
      end

      options_payload = {}
      options_payload[:transactions] = transactions_options if transactions_options != {}
      options_payload[:webhook] = webhook unless webhook.nil?
      options_payload = options_payload.merge(options) unless options.nil?

      payload = { credentials: credentials,
                  institution_id: institution_id,
                  initial_products: initial_products,
                  options: options_payload }
      @client.post_with_auth('item/create', payload)
    end

    # Public: Submit an MFA step.
    #
    # Does a POST /item/mfa call which gives you the ability to response to an MFA
    #
    # access_token - To submit MFA step for
    # mfa_type     - The MFA type indicated in the MFA response
    # responses    - List of answers/responses to MFA
    #
    # Returns a parsed JSON of ItemStatus or another MFA step
    def mfa(access_token, mfa_type, responses)
      payload = { access_token: access_token,
                  mfa_type: mfa_type,
                  responses: responses }
      @client.post_with_auth('item/mfa', payload)
    end

    # Public: Get information about an item
    #
    # Does a POST /item/get call which returns information about an item or ItemStatus
    #
    # access_token - access_token who's item to fetch status for
    #
    # Returns a parsed JSON of item information
    def get(access_token)
      payload = { access_token: access_token }
      @client.post_with_auth('item/get', payload)
    end

    # Public: Deletes an item
    #
    # Does a POST /item/delete call which is used to delete an item
    #
    # access_token - access_token who's item to delete
    #
    # Returns a parsed JSON of delete result
    def delete(access_token)
      payload = { access_token: access_token }
      @client.post_with_auth('item/delete', payload)
    end

    # Public: Removes an item
    #
    # Does a POST /item/remove call which is used to remove an item
    #
    # access_token - access_token who's item to remove
    #
    # Returns a parsed JSON of remove result
    def remove(access_token)
      payload = { access_token: access_token }
      @client.post_with_auth('item/remove', payload)
    end
  end
end
