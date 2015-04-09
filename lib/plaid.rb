require 'plaid/version'
require 'plaid/config'

require 'plaid/add_user'
require 'plaid/models/user'
require 'plaid/models/institution'
require 'plaid/models/category'

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
      res = Plaid::Connection.get('institutions', id)
      id.nil? ? Plaid::Institution.all(res) : Plaid::Institution.one(res)
    end

    # API: public
    # Builds an institution object and returns when the category details exist
    def category(id = nil)
      res = Plaid::Connection.get('categories', id)
      id.nil? ? Plaid::Category.all(res) : Plaid::Category.build(res)
    end

  end
end
