module Plaid
  class Category
    attr_accessor :type, :hierarchy, :id

    def initialize(fields = {})
      @type = fields['type']
      @hierarchy = fields['hierarchy']
      @id = fields['id']
    end

    # API: semi-private
    # This method takes an array returned from the API and instantiates all of the categories
    def self.all(res)
      res.map { |cat| new(cat) }
    end
  end
end
