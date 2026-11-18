# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WalletTransactionPayeeVerificationStatus
      extend Plaid::Internal::Types::Enum

      FULL_MATCH = "FULL_MATCH"
      PARTIAL_MATCH = "PARTIAL_MATCH"
      NO_MATCH = "NO_MATCH"
      ERROR = "ERROR"
      CHECK_NOT_POSSIBLE = "CHECK_NOT_POSSIBLE"
    end
  end
end
