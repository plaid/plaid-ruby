module Plaid
  class Transaction
    attr_accessor :id, :account, :amount, :name, :meta, :location, :pending, :score, :type, :category, :category_id

    # API: semi-private
    # This method updates Plaid::Account with the results returned from the API
    def update(res)
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
