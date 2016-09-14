require 'plaid/version'
require 'plaid/errors'
require 'plaid/connector'
require 'plaid/category'
require 'plaid/institution'
require 'plaid/user'
require 'plaid/transaction'
require 'plaid/info'
require 'plaid/income'
require 'plaid/client'
require 'plaid/webhook'

require 'uri'

# Public: The Plaid namespace.
module Plaid
  # Public: Available Plaid products.
  PRODUCTS = %i(connect auth info income risk).freeze

  class <<self
    # Public: The default Client.
    attr_accessor :client

    # Public: The Integer read timeout for requests to Plaid HTTP API.
    # Should be specified in seconds. Default value is 120 (2 minutes).
    attr_accessor :read_timeout

    # Public: A helper function to ease configuration.
    #
    # Yields self.
    #
    # Examples
    #
    #   Plaid.configure do |p|
    #     p.client_id = 'Plaid provided client ID here'
    #     p.secret = 'Plaid provided secret key here'
    #     p.env = :tartan
    #     p.read_timeout = 300   # it's 5 minutes, yay!
    #   end
    #
    # Returns nothing.
    def config
      client = Client.new
      yield client
      self.client = client
    end

    # Internal: Symbolize keys (and values) for a hash.
    #
    # hash   - The Hash with string keys (or nil).
    # values - The Boolean flag telling the function to symbolize values
    #          as well.
    #
    # Returns a Hash with keys.to_sym (or nil if hash is nil).
    def symbolize_hash(hash, values: false)
      return unless hash
      return hash.map { |h| symbolize_hash(h) } if hash.is_a?(Array)

      hash.each_with_object({}) do |(k, v), memo|
        memo[k.to_sym] = values ? v.to_sym : v
      end
    end
  end
end
