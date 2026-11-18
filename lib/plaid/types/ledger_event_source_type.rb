# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LedgerEventSourceType
      extend Plaid::Internal::Types::Enum

      TRANSFER = "TRANSFER"
      SWEEP = "SWEEP"
      REFUND = "REFUND"
    end
  end
end
