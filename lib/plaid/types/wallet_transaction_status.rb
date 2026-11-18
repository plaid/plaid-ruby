# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WalletTransactionStatus
      extend Plaid::Internal::Types::Enum

      AUTHORISING = "AUTHORISING"
      INITIATED = "INITIATED"
      EXECUTED = "EXECUTED"
      SETTLED = "SETTLED"
      BLOCKED = "BLOCKED"
      FAILED = "FAILED"
    end
  end
end
