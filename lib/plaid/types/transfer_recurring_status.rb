# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferRecurringStatus
      extend Plaid::Internal::Types::Enum

      ACTIVE = "active"
      CANCELLED = "cancelled"
      EXPIRED = "expired"
    end
  end
end
