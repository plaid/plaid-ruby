# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WalletTransactionFailureReason
      extend Plaid::Internal::Types::Enum

      EXTERNAL_SYSTEM = "EXTERNAL_SYSTEM"
      EXPIRED = "EXPIRED"
      CANCELLED = "CANCELLED"
      INVALID = "INVALID"
      ACCOUNT_INVALID = "ACCOUNT_INVALID"
      AUTHENTICATION_FAILED = "AUTHENTICATION_FAILED"
      UNKNOWN = "UNKNOWN"
    end
  end
end
