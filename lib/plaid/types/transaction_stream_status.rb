# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransactionStreamStatus
      extend Plaid::Internal::Types::Enum

      UNKNOWN = "UNKNOWN"
      MATURE = "MATURE"
      EARLY_DETECTION = "EARLY_DETECTION"
      TOMBSTONED = "TOMBSTONED"
    end
  end
end
