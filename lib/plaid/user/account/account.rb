require 'plaid/util'
module Plaid
  class Account
    include Plaid::Util
    # Define vars for user accounts
    attr_accessor(:available_balance, :current_balance, :institution_type, :meta, :transactions, :numbers, :name, :id, :type)

    # Instantiate a new account with the results of the successful API call
    # Build an array of nested transactions, and return self if successful
    def new(res)
      begin
        self.name = res['name'], self.available_balance = res['balance']['available'], self.current_balance = res['balance']['current'], self.institution_type = res['institution_type'], self.id = res['_id'], self.type = res['type']
        self.meta = res['meta'] if res['meta']
        res['numbers'] ? self.numbers = res['numbers'] : self.numbers = 'Upgrade user to access routing information for this account'
      rescue => e
        error_handler(e)
      else
        self
      end
    end

    def update_account(res)
      begin
        self.name = res['name'], self.available_balance = res['balance']['available'], self.current_balance = res['balance']['current'], self.institution_type = res['institution_type'], self.id = res['_id'], self.type = res['type']
        self.meta = res['meta'] if res['meta']
        res['numbers'] ? self.numbers = res['numbers'] : self.numbers = 'Upgrade user to access routing information for this account'
      rescue => e
        error_handler(e)
      else
        self
      end
    end

  end
end