# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SweepStatus
      extend Plaid::Internal::Types::Enum

      PENDING = "pending"
      POSTED = "posted"
      SETTLED = "settled"
      FUNDS_AVAILABLE = "funds_available"
      RETURNED = "returned"
      FAILED = "failed"
    end
  end
end
