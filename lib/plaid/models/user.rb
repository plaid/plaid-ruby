require_relative 'account'
require_relative 'transaction'
require_relative 'info'
require 'json'

module Plaid
  class User
    attr_accessor :accounts, :transactions, :access_token, :type, :permissions, :api_res, :pending_mfa_questions, :info, :information

    # API: public
    # Use this method to select the MFA method
    def select_mfa_method(selection, type=nil)
      type = self.type if type.nil?
      auth_path = self.permissions.last + '/step'
      res = Connection.post(auth_path, { options: { send_method: selection }.to_json, access_token: self.access_token, type: type })
      update(res, self.permissions.last)
    end

    # API: public
    # Use this method to send back the MFA code or answer
    def mfa_authentication(auth, type = nil)
      type = self.type if type.nil?
      auth_path = self.permissions.last + '/step'
      res = Connection.post(auth_path, { mfa: auth, access_token: self.access_token, type: type })
      self.accounts = []
      self.transactions = []
      update(res)
    end

    # API: public
    # Use this method to find out API levels available for this user
    def permit?(auth_level)
      self.permissions.include? auth_level
    end

    # API: public
    # Use this method to upgrade a user to another api level
    def upgrade(api_level=nil)
      if api_level.nil?
        api_level = 'auth' unless self.permit? 'auth'
        api_level = 'connect' unless self.permit? 'connect'
      end
      res = Connection.post('upgrade', { access_token: self.access_token, upgrade_to: api_level })

      # Reset accounts and transaction
      self.accounts = []
      self.transactions = []
      update(res)
    end

    # API: public
    # Use this method to delete a user from the Plaid API
    def delete_user
      Connection.delete('info', { access_token: self.access_token })
    end

    ### Internal build methods
    def initialize
      self.accounts = []
      self.transactions = []
      self.permissions = []
      self.access_token = ''
      self.api_res = ''
      self.info = {}
    end

    # API: semi-private
    # This class method instantiates a new Account object and updates it with the results
    # from the API
    def self.build(res, api_level = nil)
      self.new.update(res, api_level)
    end

    # API: semi-private
    # This method updates Account with the results returned from the API
    def update(res, api_level = nil)
      self.permit! api_level

      if res[:msg].nil?
        populate_user!(res)
        clean_up_user!
      else
        set_mfa_request!(res)
      end

      self
    end

    # Internal helper methods

    # API: semi-private
    # Internal helper method to set the available API levels
    def permit!(api_level)
      return if api_level.nil? || self.permit?(api_level)
      self.permissions << api_level
    end

    # API: semi-private
    # Gets auth, connect, or info of the user
    # TODO: (2.0) auth_level should be symbols instead of string
    def get(auth_level, options = {})
      return false unless self.permit? auth_level
      case auth_level
      when 'auth'
        update(Connection.post('auth/get', access_token: self.access_token))
      when 'connect'
        payload = { access_token: self.access_token }.merge(options)
        update(Connection.post('connect/get', payload))
      when 'info'
        update(Connection.secure_get('info', self.access_token))
      else
        raise "Invalid auth level: #{auth_level}"
      end
    end

    # API: semi-private
    def get_auth
      get('auth')
    end

    # API: semi-private
    def get_connect(options={})
      get('connect', options)
    end

    # API: semi-private
    def get_info
      get('info')
    end

    # API: semi-private
    # Helper method to update user information
    # Requires 'info' api level
    def update_info(username,pass,pin=nil)
      return false unless self.permit? 'info'

      payload = { username: username, password: pass, access_token: self.access_token }
      payload.merge!(pin: pin) if pin
      update(Plaid.patch('info', payload))
    end

    # API: semi-private
    # Helper method to update user balance
    def update_balance
      update(Connection.post('balance', { access_token: self.access_token }))
    end

    private

    def clean_up_user!
      self.accounts.select! { |c| c.instance_of? Account }
    end

    def set_mfa_request!(res)
      self.access_token = res[:body]['access_token']
      self.pending_mfa_questions = res[:body]
      self.api_res = res[:msg]
    end

    def populate_user!(res)
      res['accounts'].each do |account|
        if self.accounts.none? { |h| h.id == account['_id'] }
          self.accounts << Account.new(account)
        end
      end if res['accounts']

      res['transactions'].each do |transaction|
        if self.transactions.any? { |t| t == transaction['_id'] }
          owned_transaction = self.transactions.find { |h| h == transaction['_id'] }
          owned_transaction.new(transaction)
        else
          self.transactions << Transaction.new(transaction)
        end
      end if res['transactions']

      self.pending_mfa_questions = {}
      self.information = Information.new(res['info']) if res['info']
      self.api_res = 'success'

      # TODO: Remove the following line when upgrading to V-2
      self.info.merge!(res['info']) if res['info']
      # End TODO

      self.access_token = res['access_token'].split[0]
      self.type = res['access_token'].split[1]
    end

  end
end
