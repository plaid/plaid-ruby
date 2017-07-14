module Plaid
  # Internal: Support for subproduct metaprogramming
  #
  # Allows to write
  #
  #   class SomeProduct
  #     subproduct :cool, Plaid::Cool
  #   end
  module SubproductMixin
    def subproduct(name, klass)
      define_method(name) do
        ivar = "@#{name}"

        if instance_variable_defined?(ivar)
          instance_variable_get(ivar)
        else
          instance_variable_set(ivar, klass.new(client))
        end
      end
    end
  end

  # Internal: The base class for all client products
  class BaseProduct
    def initialize(client)
      @client = client
    end

    attr_reader :client

    extend SubproductMixin

    protected

    # Private: Build a simple payload with access_token, options, and
    # account_ids.
    def build_payload(access_token, account_ids: nil, options: nil)
      options_payload = {}
      options_payload[:account_ids] = account_ids unless account_ids.nil?
      options_payload.merge!(options) unless options.nil?

      { access_token: access_token,
        options: options_payload }
    end

    # Private: Do a POST to API and capture it into a response object.
    def post_with_auth(path, response_class, payload)
      response_class.new(client.post_with_auth(path, payload))
    end

    # Private: Do a POST to API and capture it into a response object.
    def post_with_public_key(path, response_class, payload)
      response_class.new(client.post_with_public_key(path, payload))
    end
  end
end
