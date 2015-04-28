module Plaid
  class Category
    attr_accessor :type, :hierarchy, :id

    def initialize(type, hierarchy, id)
      @type = type
      @hierarchy = hierarchy
      @id = id
    end

    # API: semi-private
    # This method takes an array returned from the API and instantiates all of the categories
    def self.all(res)
      res.map { |cat| build(cat) }
    end

    # API: semi-private
    # This method instantiates and builds a single category
    def self.build(cat)
      new(cat['type'], cat['hierarchy'], cat['id'])
    end
  end
end
