# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WalletTransactionRelationType
      extend Plaid::Internal::Types::Enum

      PAYOUT = "PAYOUT"
      RETURN = "RETURN"
      REFUND = "REFUND"
      FUNDS_SWEEP = "FUNDS_SWEEP"
    end
  end
end
