require 'plaidio/config'
require 'plaidio/call'
require 'plaidio/customer'
require 'rest_client'
module Plaidio
  class << self
    include Plaidio::Configure

    # Defined when a user exists with a unique access_token. Ex: Plaidio.customer.get_transactions
    def customer
      @customer = Plaidio::Customer.new
    end

    # Defined for generic calls without access_tokens required. Ex: Plaidio.call.add_accounts(username,password,type)
    def call
      @call = Plaidio::Call.new
    end

  end
end