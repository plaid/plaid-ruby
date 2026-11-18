# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module InvestmentTransactionType
      extend Plaid::Internal::Types::Enum

      BUY = "buy"
      SELL = "sell"
      CANCEL = "cancel"
      CASH = "cash"
      FEE = "fee"
      TRANSFER = "transfer"
    end
  end
end
