module Plaid
  class Transaction
    attr_accessor :id, :account, :date, :amount, :name, :meta, :location, :pending, :score, :cat, :type, :category, :category_id, :pending_transaction

    def initialize(fields = {})
      @id = fields['_id']
      @account = fields['_account']
      @date = fields['date']
      @amount = fields['amount']
      @name = fields['name']
      @location = fields['meta'].nil? ? {} : fields['meta']['location']
      @pending = fields['pending']
      @pending_transaction = fields['_pendingTransaction']
      @score = fields['score']
      @cat = Category.new({ 'id' => fields['category_id'], 'hierarchy' => fields['category'], 'type' => fields['type'] })

      # Here for backwards compatibility only.
      @type = fields['type']
      @category = fields['category']
      @category_id = fields['category_id']
      @meta = fields['meta']
    end
  end
end
