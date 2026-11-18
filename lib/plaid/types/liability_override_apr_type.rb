# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LiabilityOverrideAprType
      extend Plaid::Internal::Types::Enum

      BALANCE_TRANSFER_APR = "balance_transfer_apr"
      CASH_APR = "cash_apr"
      PENALTY_APR = "penalty_apr"
      PURCHASE_APR = "purchase_apr"
      SPECIAL = "special"
    end
  end
end
