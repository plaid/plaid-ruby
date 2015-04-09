module Plaid
  class Category
    attr_accessor :type, :hierarchy, :id

    class << self
      # API: semi-private
      # This method takes an array returned from the API and instantiates
      # all of the categories
      def all(res)
        res.map { |cat| self.build(cat) }
      end

      # API: semi-private
      # This method instantiates and builds a single category
      def build(res)
        self.new.update(res)
      end
    end

    # API: semi-private
    # This method updates a Plaid:Category based upon the results from the API
    def update(cat)
      self.type = cat['type']
      self.hierarchy = cat['hierarchy']
      self.id = cat['id']
      return self
    end
  end
end
