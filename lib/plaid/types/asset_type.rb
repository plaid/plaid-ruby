# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AssetType
      extend Plaid::Internal::Types::Enum

      CHECKING_ACCOUNT = "CheckingAccount"
      SAVINGS_ACCOUNT = "SavingsAccount"
      INVESTMENT = "Investment"
      MONEY_MARKET_FUND = "MoneyMarketFund"
      OTHER = "Other"
    end
  end
end
