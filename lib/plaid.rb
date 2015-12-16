require 'plaid/version'
require 'plaid/config'
require 'plaid/errors'

require 'plaid/models/user'
require 'plaid/models/institution'
require 'plaid/models/category'
require 'plaid/models/exchange_token_response'

require 'json'

module Plaid
  autoload :Connection, 'plaid/connection'

  class << self
    # Configures the gem with the public, private, and environment vars
    include Configure

    # API: public
    # Use this to create a new Plaid user
    # Required parameters:
    #   api_level, username, password, type
    # TODO: Rename this to something more descriptive for 2.0, such as 'create_user`
    def add_user(api_level, username, password, type, pin = nil, options = nil)
      payload = { username: username, password: password, type: type }

      payload[:pin]     = pin if pin
      payload[:options] = options.is_a?(Hash) ? JSON.generate(options) : options if options

      res = Connection.post(api_level, payload)
      User.build(res, api_level)
    end

    # API: public
    # Exchange a Plaid Link public_token for a Plaid access_token
    # Required parameters:
    #   public_token
    #   account_id (optional)
    def exchange_token(public_token, account_id = nil)
      payload = { public_token: public_token }
      # include the account id, if set
      payload[:account_id] = account_id if account_id

      res = Connection.post('exchange_token', payload)
      ExchangeTokenResponse.new(res)
    end

    # API: public
    # Use this to restore a user from Plaid based upon the access token
    # TODO: Rename this to something more descriptive for 2.0, such as 'get_user'
    def set_user(token, api_levels=[], institution_type=nil)
      _user = User.new
      _user.access_token = fully_qualified_token(token, institution_type)
      _user.permissions = api_levels
      api_levels.each { |l| _user.get(l) }
      _user
    end

    # API: public
    # Given an access code and query options, use this to get a dataset of
    # transactions and accounts for # a given user. See /connect/get endpoint
    #
    # Returns a User object with accounts and transactions within
    # the date range given
    # Examples:
    #   Plaid.transactions 'test_wells', account: 'QPO8Jo8vdDHMepg41PBwckXm4KdK1yUdmXOwK'
    def transactions(token, options = {})
      _user = User.new
      _user.access_token = token
      _user.permit! 'connect'

      # TODO: For 2.0, submit all data as JSON
      options = JSON.generate(options) if options.kind_of?(Hash)

      _user.get_connect(options: options)
      _user
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
      res = Connection.get('institutions', id)
      id.nil? ? Institution.all(res) : Institution.new(res)
    end

    # API: public
    # Builds an category object and returns when the category details exist
    def category(id = nil)
      res = Connection.get('categories', id)
      id.nil? ? Category.all(res) : Category.new(res)
    end
  end
end
