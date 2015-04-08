module Plaid
  class Category
    attr_accessor :type, :hierarchy, :id

    class << self
      def all(res)
        res.map { |cat| self.one(cat) }
      end

      def one(res)
        self.new.build_category(res)
      end
    end

    def build_category(cat)
      self.type = cat['type']
      self.hierarchy = cat['hierarchy']
      self.id = cat['id']
      return self
    end
  end
end
