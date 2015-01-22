require 'plaid/util'
module Plaid
  class Category
    include Plaid::Util

    attr_accessor(:type, :hierarchy, :id, :cat_array)

    def instantiate_all_categories(res)
      self.cat_array = []
      res.each do |cat|
        category = Category.new
        self.cat_array << category.build_category(cat)
      end
      self.cat_array
    end

    def instantiate_one_category(res)
      self.build_category(res)
      self
    end

    protected

    def build_category(cat)
      self.type = cat['type'], self.hierarchy = cat['hierarchy'], self.id = cat['id']
    end

  end
end