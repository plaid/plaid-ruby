require_relative 'account/account'
require_relative 'transaction/transaction'
require 'plaid/util'
module Plaid
  class Plaid::User
    include Plaid::Util

    # Define user vars
    attr_accessor(:accounts, :transactions, :access_token, :permissions, :api_res, :pending_mfa_questions)

    def initialize
      self.accounts = []
      self.transactions = []
      self.permissions = []
      self.access_token = ''
      self.api_res = ''
    end

    # Instantiate a new user with the results of the successful API call
    # Build an array of nested accounts, and return self if successful
    def new(res,api_level=nil)
      build_user(res,api_level)
    end

    def mfa_authentication(auth,type)
      auth_path = self.permissions[0] + '/step'
      res = Plaid.post(auth_path,{mfa:auth,access_token:self.access_token,type:type})
      self.accounts = [], self.transactions = []
      update_user(res)
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

    def upgrade
      upgrade_to = 'auth' unless self.permissions.include? 'auth'
      upgrade_to = 'connect' unless self.permissions.include? 'connect'
      res = Plaid.post('upgrade',{access_token:self.access_token,upgrade_to:upgrade_to})
      build_user(res)
    end

    protected

    def build_user(res,api_level=nil)
      begin
        if res[:msg].nil?
          res['accounts'].each do |account|
            self.accounts << new_account(account)
          end if res['accounts']
          res['transactions'].each do |transaction|
            self.transactions << new_transaction(transaction)
          end if res['transactions']
          self.permissions << api_level
          self.access_token = res['access_token']
          self.api_res = 'success'
          clean_up_user(self)
        else
          self.pending_mfa_questions = res[:body], self.accounts = res[:msg], self.transactions = res[:msg], self.permissions << api_level, self.access_token = res[:body]['access_token'], self.api_res = res[:msg]
        end
      rescue => e
        error_handler(e)
      else
        self
      end
    end

    def update_user(res,api_level=nil)
      begin
        if res[:msg].nil?
          res['accounts'].each do |account|
            self.accounts << new_account(account)
          end if res['accounts']
          res['transactions'].each do |transaction|
            self.transactions << new_transaction(transaction)
          end if res['transactions']
          self.permissions << api_level
          self.api_res = 'success'
          self.pending_mfa_questions = ''
        else
          self.pending_mfa_questions = res[:body]
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