# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BankTransferStatus
      extend Plaid::Internal::Types::Enum

      PENDING = "pending"
      POSTED = "posted"
      CANCELLED = "cancelled"
      FAILED = "failed"
      REVERSED = "reversed"
    end
  end
end
