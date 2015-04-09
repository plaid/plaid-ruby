require_relative 'account'
require_relative 'transaction'
require_relative 'info'
require 'json'

module Plaid
  class User
    attr_accessor :accounts, :transactions, :access_token, :type, :permissions, :api_res, :pending_mfa_questions, :info, :information

    def initialize
      self.accounts = []
      self.transactions = []
      self.permissions = []
      self.access_token = ''
      self.api_res = ''
      self.info = {}
      self.information = Information.new
    end

    # Instantiate a new user with the results of the successful API call
    # Build an array of nested accounts, and return self if successful
    def new(res, api_level = nil)
      build_user(res, api_level)
    end

    def mfa_authentication(auth, type = nil)
      type = self.type if type.nil?
      auth_path = self.permissions.last + '/step'
      res = Plaid::Connection.post(auth_path, { mfa: auth, access_token: self.access_token, type: type })
      self.accounts = []
      self.transactions = []
      build_user(res)
    end

    def select_mfa_method(selection,type=nil)
      type = self.type if type.nil?
      auth_path = self.permissions.last + '/step'
      res = Plaid::Connection.post(auth_path, { options: { send_method: selection }.to_json, access_token: self.access_token, type: type })
      build_user(res,self.permissions.last)
    end

    def permit?(auth_level)
      self.permissions.include? auth_level
    end

    def permit!(api_level)
      return if api_level.nil? || self.permit?(api_level)
      self.permissions << api_level
    end

    # TODO: (2.0) auth_level should be symbols instead of string
    def get(auth_level, options = {})
      return false unless self.permit? auth_level
      case auth_level
      when 'auth'
        build_user(Plaid::Connection.post('auth/get', access_token: self.access_token))
      when 'connect'
        payload = { access_token: self.access_token }.merge(options)
        build_user(Plaid::Connection.post('connect/get', payload))
      when 'info'
        build_user(Plaid::Connection.secure_get('info', self.access_token))
      else
        raise "Invalid auth level: #{auth_level}"
      end
    end

    def get_auth
      get('auth')
    end

    def get_connect(options={})
      get('connect', options)
    end

    def get_info
      get('info')
    end

    def update_info(username,pass,pin=nil)
      if self.permissions.include? 'info'
        payload = {username:username,password:pass,access_token:self.access_token}
        payload.merge!({pin:pin}) if pin
        res = Plaid.patch('info',payload)
        puts res
        build_user(res)
      else
        false
      end
    end

    def update_balance
      res = Plaid::Connection.post('balance',{access_token:self.access_token})
      build_user(res)
    end

    def upgrade(api_level=nil)
      if api_level.nil?
        api_level = 'auth' unless self.permissions.include? 'auth'
        api_level = 'connect' unless self.permissions.include? 'connect'
      end
      res = Plaid::Connection.post('upgrade', { access_token: self.access_token, upgrade_to: api_level})
      self.accounts = [], self.transactions = []
      build_user(res)
    end

    def delete_user
      Plaid::Connection.delete('info', { access_token: self.access_token })
    end

    protected

    def build_user(res, api_level = nil)
      self.permit! api_level

      if res[:msg].nil?
        populate_user!(res)
        clean_up_user!
      else
        set_mfa_request!(res)
      end

      return self
    end

    private

    def clean_up_user!
      self.accounts.select! { |c| c.instance_of? Plaid::Account }
    end

    def set_mfa_request!(res)
      self.access_token = res[:body]['access_token']
      self.pending_mfa_questions = res[:body]
      self.api_res = res[:msg]
    end

    def populate_user!(res)
      res['accounts'].each do |account|
        if self.accounts.any? { |h| h == account['_id'] }
          owned_account = self.accounts.find { |h| h == account['_id'] }
          owned_account.new(account)
        else
          self.accounts << Plaid::Account.build(account)
        end
      end if res['accounts']

      res['transactions'].each do |transaction|
        if self.transactions.any? { |t| t == transaction['_id'] }
          owned_transaction = self.transactions.find { |h| h == transaction['_id'] }
          owned_transaction.new(transaction)
        else
          self.transactions << Plaid::Transaction.build(transaction)
        end
      end if res['transactions']

      self.pending_mfa_questions = ''
      self.information.update(res['info']) if res['info']
      self.api_res = 'success'

      # TODO: Remove the following line when upgrading to V-2
      self.info.merge!(res['info']) if res['info']
      # End TODO

      self.access_token = res['access_token'].split[0]
      self.type = res['access_token'].split[1]
    end

  end
end
