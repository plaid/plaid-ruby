require 'plaidio/config'
require 'plaidio/call'
require 'plaidio/customer'
module Plaidio 
  class << self
    include Plaidio::Configure
    
    # Defined when a user exists with a unique access_token. Ex: Plaidio.customer.get_transactions
    def customer(access_token)
      if !defined?(@access_token) || @access_token != access_token
        @access_token = access_token
        @customer = Plaidio::Customer.new(options.merge({access_token: access_token}))
      end
      @customer
    end
    
    # Defined for generic calls without access_tokens required. Ex: Plaidio.call.add_accounts(username,password,type)
    def call
      @call = Plaidio::Call.new
    end
    
  end
end