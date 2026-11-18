# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxDataCluster
      extend Plaid::Internal::Types::Enum

      ACCOUNT_BASIC = "ACCOUNT_BASIC"
      ACCOUNT_DETAILED = "ACCOUNT_DETAILED"
      ACCOUNT_PAYMENTS = "ACCOUNT_PAYMENTS"
      BILLS = "BILLS"
      CUSTOMER_CONTACT = "CUSTOMER_CONTACT"
      CUSTOMER_PERSONAL = "CUSTOMER_PERSONAL"
      IMAGES = "IMAGES"
      INVESTMENTS = "INVESTMENTS"
      NOTIFICATIONS = "NOTIFICATIONS"
      PAYMENT_SUPPORT = "PAYMENT_SUPPORT"
      REWARDS = "REWARDS"
      STATEMENTS = "STATEMENTS"
      TAX = "TAX"
      TRANSACTIONS = "TRANSACTIONS"
      BALANCES = "BALANCES"
      SCHEDULED_PAYMENTS = "SCHEDULED_PAYMENTS"
    end
  end
end
