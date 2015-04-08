module Plaid
  class Transaction
    attr_accessor :id, :account, :amount, :name, :meta, :location, :pending, :score, :type, :category, :category_id

    # Instantiate a new account with the results of the successful API call
    # Build an array of nested transactions, and return self if successful
    def new(res)
      self.id       = res['_id']
      self.account  = res['_account']
      self.amount   = res['amount']
      self.name     = res['name']
      self.meta     = res['meta']
      self.location = res['location']
      self.pending  = res['pending']
      self.score    = res['score']
      self.type     = res['type']

      self.category    = res['category']
      self.category_id = res['category_id']
      return self
    rescue => e
      error_handler(e)
    end

  end
end
