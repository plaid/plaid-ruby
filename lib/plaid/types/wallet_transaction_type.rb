# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WalletTransactionType
      extend Plaid::Internal::Types::Enum

      BANK_TRANSFER = "BANK_TRANSFER"
      PAYOUT = "PAYOUT"
      PIS_PAY_IN = "PIS_PAY_IN"
      REFUND = "REFUND"
      FUNDS_SWEEP = "FUNDS_SWEEP"
      RETURN = "RETURN"
      RECALL = "RECALL"
      ACCOUNT_FUNDING = "ACCOUNT_FUNDING"
      AUTO_REFUND = "AUTO_REFUND"
      TRANSFER_OUT = "TRANSFER_OUT"
    end
  end
end
