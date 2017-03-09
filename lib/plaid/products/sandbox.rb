module Plaid
  # Public: Class used to call the SandboxItem sub-product.
  class SandboxItem
    def initialize(client)
      @client = client
    end

    # Public: Resets sandbox item login
    #
    # Does a POST /sandbox/item/reset_login call
    #
    # access_token - access_token who's item to reset login for
    #
    # Returns a parsed JSON of response
    def reset_login(access_token)
      payload = { access_token: access_token }
      @client.post_with_auth('sandbox/item/reset_login', payload)
    end
  end

  # Public: Class used to call the Sandbox product.
  class Sandbox
    # Public: Memoized class instance to make requests from Plaid::SandboxItem
    def sandbox_item
      @sandbox_item ||= Plaid::SandboxItem.new(@client)
    end

    def initialize(client)
      @client = client
    end
  end
end
