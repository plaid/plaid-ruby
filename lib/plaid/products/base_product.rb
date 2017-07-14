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

    def build_payload(access_token, account_ids: nil, options: nil)
      options_payload = {}
      options_payload[:account_ids] = account_ids unless account_ids.nil?
      options_payload.merge!(options) unless options.nil?

      { access_token: access_token,
        options: options_payload }
    end
  end
end
