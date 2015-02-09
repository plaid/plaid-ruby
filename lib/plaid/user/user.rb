require_relative 'account/account'
require_relative 'transaction/transaction'
require 'plaid/util'
module Plaid
  class Plaid::User
    include Plaid::Util

    # Define user vars
    attr_accessor(:accounts, :transactions, :access_token, :permissions, :api_res, :pending_mfa_questions, :info)

    def initialize
      self.accounts = []
      self.transactions = []
      self.permissions = []
      self.access_token = ''
      self.api_res = ''
      self.info = {}
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

    def get_auth
      if self.permissions.include? 'auth'
        res = Plaid.post('auth/get',{access_token:self.access_token})
        build_user(res)
      else
        false
      end
    end

    def get_connect
      if self.permissions.include? 'connect'
        res = Plaid.post('connect/get',{access_token:self.access_token})
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
      build_user(res)
    end

    def delete_user
      Plaid.delete('info',{access_token:self.access_token})
    end

    protected

    def build_user(res,api_level=nil)
      begin
        if res[:msg].nil?
          res['accounts'].each do |account|
            if self.accounts.any? { |h| h.id == account['_id'] }
              owned_account = self.accounts.find { |h| h.id == account['_id'] }
              owned_account.new(account)
            else
              self.accounts << new_account(account)
            end
          end if res['accounts']
          res['transactions'].each do |transaction|
            #if self.transactions.any? { |h| h.id == transaction['_id'] }
            # owned_transaction = self.transactions.find { |h| h.id == transaction['_id'] }
            #  owned_transaction.new(transaction)
            #else
              self.transactions << new_transaction(transaction)
            #end
          end if res['transactions']
          self.permissions << api_level unless self.permissions.include? api_level
          self.api_res = 'success'
          self.pending_mfa_questions = ''
          clean_up_user(self)
        else
          self.access_token = res[:body]['access_token'] if self.access_token.nil?
          self.pending_mfa_questions = res[:body], self.api_res = res[:msg], self.permissions << api_level
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

  end
end