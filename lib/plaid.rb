require 'plaid/config'
require 'plaid/call'
require 'plaid/customer'
require 'rest_client'
module Plaid
  class << self
    include Plaid::Configure

    # Defined when a user exists with a unique access_token. Ex: Plaid.customer.get_transactions
    def customer
      @customer = Plaid::Customer.new
    end

    # Defined for generic calls without access_tokens required. Ex: Plaid.call.add_accounts(username,password,type)
    def call
      @call = Plaid::Call.new
    end

  end
end
