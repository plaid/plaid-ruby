require 'plaid/version'
require 'plaid/config'

require 'plaid/models/user'
require 'plaid/models/institution'
require 'plaid/models/category'

module Plaid
  autoload :Connection, 'plaid/connection'

  class << self
    # Configures the gem with the public, private, and environment vars
    include Plaid::Configure

    # API: public
    # Use this to create a new Plaid user
    # Required parameters:
    #   api_level, username, password, type
    # TODO: Rename this to something more descriptive for 2.0, such as 'create_user`
    def add_user(api_level, username, password, type, pin = nil, options = nil)
      payload = { username: username, password: password, type: type }

      payload[:pin]     = pin if pin
      payload[:options] = options.is_a?(Hash) ? JSON.generate(options) : options if options

      res = Plaid::Connection.post(api_level, payload)
      Plaid::User.build(res, api_level)
    end

    # API: public
    # Use this to restore a user from Plaid based upon the access token
    # TODO: Rename this to something more descriptive for 2.0, such as 'get_user'
    def set_user(token, api_levels=[], institution_type=nil)
      _user = Plaid::User.new
      _user.access_token = fully_qualified_token(token, institution_type)
      _user.permissions = api_levels
      api_levels.each { |l| _user.get(l) }
      return _user
    end

    # API: public
    # Returns the fully-qualified token based upon type
    # Note: Don't see this documented in the Plaid API docs, need to investigate this
    def fully_qualified_token(token, institution_type)
      institution_type.nil? ? token : token + '_' + institution_type
    end

    # API: public
    # Builds an institution object and returns when the institution details exist
    def institution(id = nil)
      res = Plaid::Connection.get('institutions', id)
      id.nil? ? Plaid::Institution.all(res) : Plaid::Institution.build(res)
    end

    # API: public
    # Builds an category object and returns when the category details exist
    def category(id = nil)
      res = Plaid::Connection.get('categories', id)
      id.nil? ? Plaid::Category.all(res) : Plaid::Category.build(res)
    end
  end
end
