require_relative 'account/account'
require_relative 'transaction/transaction'
require_relative 'info/info'
require 'plaid/util'
require 'json'
module Plaid
  class Plaid::User
    include Plaid::Util

    # Define user vars
    attr_accessor(:accounts, :transactions, :access_token, :permissions, :api_res, :pending_mfa_questions, :info, :information)

    def initialize
      self.accounts = [], self.transactions = [], self.permissions = [], self.access_token = '', self.api_res = '', self.info = {}, self.information = Information.new
    end

    # Instantiate a new user with the results of the successful API call
    # Build an array of nested accounts, and return self if successful
    def new(res,api_level=nil)
      build_user(res,api_level)
    end

    def mfa_authentication(auth,type)
      auth_path = self.permissions.last + '/step'
      res = Plaid.post(auth_path,{mfa:auth,access_token:self.access_token,type:type})
      self.accounts = [], self.transactions = []
      build_user(res)
    end

    def select_mfa_method(selection,type)
      auth_path = self.permissions.last + '/step'
      res = Plaid.post(auth_path,{options:{send_method: selection}.to_json, access_token:self.access_token,type:type})
      build_user(res,self.permissions.last)
    end

    def get_auth
      if self.permissions.include? 'auth'
        res = Plaid.post('auth/get',{access_token:self.access_token})
        build_user(res)
      else
        false
      end
    end

    def get_connect(options=nil)
      if self.permissions.include? 'connect'
        payload = {access_token:self.access_token}
        payload.merge!(options) if options
        res = Plaid.post('connect/get',payload)
        build_user(res)
      else
        false
      end
    end

    def get_info
      if self.permissions.include? 'info'
        res = Plaid.get('info',{access_token:self.access_token})
        build_user(res)
      else
        false
      end
    end

    def update_info(username,pass,pin=nil)
      if self.permissions.include? 'info'
        payload = {username:username,password:pass,access_token:self.access_token}
        payload.merge!({pin:pin}) if pin
        res = Plaid.patch('info',payload)
        build_user(res)
      else
        false
      end
    end

    def update_balance
      res = Plaid.post('balance',{access_token:self.access_token})
      build_user(res)
    end

    def upgrade(api_level=nil)
      if api_level.nil?
        api_level = 'auth' unless self.permissions.include? 'auth'
        api_level = 'connect' unless self.permissions.include? 'connect'
      end
      res = Plaid.post('upgrade',{access_token:self.access_token,upgrade_to:api_level})
      self.accounts = [], self.transactions = []
      build_user(res)
    end

    def delete_user
      Plaid.delete('info',{access_token:self.access_token})
    end

    protected

    def build_user(res,api_level=nil)
      begin
        if res[:msg].nil?
          populate_user(self,res,api_level)
          clean_up_user(self)
        else
          set_mfa_request(self,res,api_level)
        end
      rescue => e
        error_handler(e)
      else
        self
      end
    end

    # Instantiate and build a new account object, return this to the accounts array
    def new_account(account)
      @account = Account.new
      @account.new(account)
    end

    # Instantiate and build a new account object, return this to the accounts array
    def new_transaction(transaction)
      @transaction = Transaction.new
      @transaction.new(transaction)
    end

    private

    def clean_up_user(user)
      user.accounts.reject! { |c| !c.instance_of? Plaid::Account }
      user
    end

    def set_mfa_request(user,res,api_level)
      user.access_token = res[:body]['access_token']
      user.pending_mfa_questions = res[:body]
      user.api_res = res[:msg]
      user.permissions << api_level unless self.permissions.include? api_level && api_level.nil?
    end

    def populate_user(user,res,api_level)
      res['accounts'].each do |account|
        if user.accounts.any? { |h| h == account['_id'] }
          owned_account = user.accounts.find { |h| h == account['_id'] }
          owned_account.new(account)
        else
          user.accounts << new_account(account)
        end
      end if res['accounts']

      res['transactions'].each do |transaction|
        if user.transactions.any? { |t| t == transaction['_id'] }
          owned_transaction = user.transactions.find { |h| h == transaction['_id'] }
          owned_transaction.new(transaction)
        else
          user.transactions << new_transaction(transaction)
        end
      end if res['transactions']

      user.permissions << api_level unless user.permissions.include? api_level && api_level.nil?
      user.pending_mfa_questions = ''
      user.information.update_info(res['info']) if res['info']
      user.api_res = 'success'

      # TODO: Remove the following line when upgrading to V-2
      user.info.merge!(res['info']) if res['info']
      # End TODO
      user.access_token = res['access_token']
    end

  end
end