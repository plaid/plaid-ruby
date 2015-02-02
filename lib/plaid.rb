require 'plaid/version'
require 'plaid/config'
require 'plaid/util'

require 'plaid/add_user'
require 'plaid/user/user'
require 'plaid/institution/institution'
require 'plaid/category/category'

module Plaid
  class << self
    # Configures the gem with the public, private, and environment vars
    include Plaid::Configure

    # Include the utility classes used throughout the gem
    include Plaid::Util

    # Includes the method to authenticate the user. Defined in auth.rb
    include Plaid::AddUser

    # Builds the user object and returns on successful authentication
    def user(res,api_level=nil)
      @user = Plaid::User.new
      @user.new(res,api_level)
    end

    # Builds an institution object and returns when the institution details exist
    def institution(id=nil)
      @institution = Plaid::Institution.new
      res = self.get('institutions',id)
      id.nil? ? @institution.instantiate_all_institutions(res) : @institution.instantiate_one_institution(res)
    end

    # Builds an institution object and returns when the category details exist
    def category(id=nil)
      @category = Plaid::Category.new
      res = self.get('categories',id)
      id.nil? ? @category.instantiate_all_categories(res) : @category.instantiate_one_category(res)
    end

  end
end