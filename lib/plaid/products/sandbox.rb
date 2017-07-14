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
    # Returns a ResetLoginResponse object.
    def reset_login(access_token)
      payload = { access_token: access_token }

      ResetLoginResponse.new(
        @client.post_with_auth('sandbox/item/reset_login', payload))
    end

    class ResetLoginResponse < Models::BaseResponse
      # Public: The Boolean reset success flag.
      property :reset_login
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
