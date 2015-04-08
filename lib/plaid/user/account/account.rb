require 'plaid/util'
module Plaid
  class Account
    include Plaid::Util
    attr_accessor :available_balance, :current_balance, :institution_type, :meta, :transactions, :numbers, :name, :id, :type

    # Instantiate a new account with the results of the successful API call
    # Build an array of nested transactions, and return self if successful
    def new(res)
      self.name = res['name']
      self.id   = res['_id']
      self.type = res['type']
      self.meta = res['meta'] if res['meta']

      if res['balance']
        self.available_balance = res['balance']['available']
        self.current_balance   = res['balance']['current']
      end

      self.institution_type  = res['institution_type']

      self.numbers = res['numbers'] ? res['numbers'] : 'Upgrade user to access routing information for this account'
      return self
    rescue => e
      error_handler(e)
    end

    # This is really an aliased method. Keep it here for
    # now until releasing for 2.0
    def update_account(res)
      new(res)
    end
  end
end
