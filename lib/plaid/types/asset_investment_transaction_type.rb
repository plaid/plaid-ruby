# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AssetInvestmentTransactionType
      extend Plaid::Internal::Types::Enum

      BUY = "Buy"
      SELL = "Sell"
      DIVIDENDS = "Dividends"
      INTEREST = "Interest"
      TRANSFERS = "Transfers"
      REINVESTMENTS = "Reinvestments"
      FUNDS_RECEIVED = "FundsReceived"
      OTHER = "Other"
    end
  end
end
