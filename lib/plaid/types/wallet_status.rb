# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WalletStatus
      extend Plaid::Internal::Types::Enum

      UNKNOWN = "UNKNOWN"
      ACTIVE = "ACTIVE"
      CLOSED = "CLOSED"
      BLOCKED = "BLOCKED"
    end
  end
end
