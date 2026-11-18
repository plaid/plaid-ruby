# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BankTransferEventType
      extend Plaid::Internal::Types::Enum

      PENDING = "pending"
      CANCELLED = "cancelled"
      FAILED = "failed"
      POSTED = "posted"
      REVERSED = "reversed"
    end
  end
end
