module Plaid
  class Account
    attr_accessor :available_balance, :current_balance, :institution_type, :meta, :transactions, :numbers, :name, :id, :type, :subtype

    # API: semi-private
    # This method updates Plaid::Account with the results returned from the API
    def update(res)
      self.name = res['name']
      self.id   = res['_id']
      self.type = res['type']
      # Depository account only, "checkings" or "savings"
      # Available on live data, but not on the test data
      self.subtype = res['subtype']

      self.meta = res['meta'] if res['meta']

      if res['balance']
        self.available_balance = res['balance']['available']
        self.current_balance   = res['balance']['current']
      end

      self.institution_type  = res['institution_type']

      self.numbers = res['numbers'] ? res['numbers'] : 'Upgrade user to access routing information for this account'
      return self
    end

    class << self
      # API: semi-private
      # This class method instantiates a new Plaid::Account object and updates it with the results
      # from the API
      def build(res)
        self.new.update(res)
      end
    end
  end
end
