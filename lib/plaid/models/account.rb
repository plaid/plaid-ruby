module Plaid
  class Account
    attr_accessor :available_balance, :current_balance, :institution_type, :meta, :transactions, :numbers, :name, :id, :type, :subtype

    def initialize(hash)
      @id   = hash['_id']
      @name = hash['meta']['name'] if hash['meta']
      @type = hash['type']
      @meta = hash['meta']
      @institution_type  = hash['institution_type']

      if hash['balance']
        @available_balance = hash['balance']['available']
        @current_balance   = hash['balance']['current']
      end

      # Depository account only, "checkings" or "savings"
      # Available on live data, but not on the test data
      @subtype = hash['subtype']

      @numbers = hash['numbers'] ? hash['numbers'] : 'Upgrade user to access routing information for this account'
    end
  end
end
