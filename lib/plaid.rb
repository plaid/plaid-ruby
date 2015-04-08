require 'plaid/version'
require 'plaid/config'

require 'plaid/add_user'
require 'plaid/user/user'
require 'plaid/institution/institution'
require 'plaid/category/category'

module Plaid
  autoload :Connection, 'plaid/connection'

  class << self
    # Configures the gem with the public, private, and environment vars
    include Plaid::Configure

    # Includes the method to authenticate the user. Defined in auth.rb
    include Plaid::AddUser

    # Builds the user object and returns on successful authentication
    def user(res, api_level = nil)
      _user = Plaid::User.new
      _user.new(res,api_level)
    end

    def existing_user(token, api_levels = [])
      _user = Plaid::User.new
      _user.access_token = token
      _user.permissions = api_levels
      api_levels.each { |l| _user.get(l) }
      return _user
    end

    # Builds an institution object and returns when the institution details exist
    def institution(id = nil)
      _institution = Plaid::Institution.new
      res = Plaid::Connection.get('institutions',id)
      id.nil? ? _institution.instantiate_all_institutions(res) : _institution.instantiate_one_institution(res)
    end

    # Builds an institution object and returns when the category details exist
    def category(id = nil)
      _category = Plaid::Category.new
      res = Plaid::Connection.get('categories',id)
      id.nil? ? _category.instantiate_all_categories(res) : _category.instantiate_one_category(res)
    end

  end
end
