require_relative 'account/account'
require_relative 'transaction/transaction'
require 'plaid/util'
module Plaid
  class User
    include Plaid::Util

    # Define user vars
    attr_accessor(:accounts, :transactions, :access_token)

    def initialize
      self.accounts = []
      self.transactions = []
      self.access_token = ''
    end

    # Instantiate a new user with the results of the successful API call
    # Build an array of nested accounts, and return self if successful
    def new(res)
      begin
        self.access_token = res['access_token']
        if res['msg'].nil?
          res['accounts'].each do |account|
            self.accounts << new_account(account)
          end if res['accounts']
          res['transactions'].each do |transaction|
            self.transactions << new_transaction(transaction)
          end if res['transactions']
        else
          self.accounts = res.msg, self.transactions = res.msg
        end
      rescue => e
        error_handler(e)
      else
        self
      end
    end

    protected

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

  end
end