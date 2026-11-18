# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferRefundStatus
      extend Plaid::Internal::Types::Enum

      PENDING = "pending"
      POSTED = "posted"
      CANCELLED = "cancelled"
      FAILED = "failed"
      SETTLED = "settled"
      RETURNED = "returned"
    end
  end
end
