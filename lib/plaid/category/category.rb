require 'plaid/util'
module Plaid
  class Category
    include Plaid::Util

    attr_accessor(:type, :hierarchy, :id)

    # Returns an instantiated category object, or an array of all categories
    def new(id=nil)
      res = get('categories',id)
      id.nil? ? cat = instantiate_all_categories(res) : cat = instantiate_one_category(res)
      cat
    end

    def instantiate_all_categories(res)
      cat_array = []
      res['category'].each do |cat|
        @category = Category.new
        cat_array << @category.build_category(cat)
      end
      cat_array
    end

    def instantiate_one_category(res)
      @category = Category.new
      @category.build_category(res)
    end

    protected

    def build_category(cat)
      self.type = cat['type'], self.hierarchy = cat['hierarchy'], self.id = cat['id']
    end

  end
end