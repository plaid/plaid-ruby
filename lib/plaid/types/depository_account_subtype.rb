# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module DepositoryAccountSubtype
      extend Plaid::Internal::Types::Enum

      CHECKING = "checking"
      SAVINGS = "savings"
      HSA = "hsa"
      CD = "cd"
      MONEY_MARKET = "money market"
      PAYPAL = "paypal"
      PREPAID = "prepaid"
      CASH_MANAGEMENT = "cash management"
      EBT = "ebt"
      LIMITED_PURPOSE_CHECKING = "limited purpose checking"
      ALL = "all"
    end
  end
end
