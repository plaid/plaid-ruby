# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferStatus
      extend Plaid::Internal::Types::Enum

      PENDING = "pending"
      POSTED = "posted"
      SETTLED = "settled"
      FUNDS_AVAILABLE = "funds_available"
      CANCELLED = "cancelled"
      FAILED = "failed"
      RETURNED = "returned"
    end
  end
end
