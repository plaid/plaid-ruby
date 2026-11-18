# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SweepTrigger
      extend Plaid::Internal::Types::Enum

      MANUAL = "manual"
      INCOMING = "incoming"
      BALANCE_THRESHOLD = "balance_threshold"
      AUTOMATIC_AGGREGATE = "automatic_aggregate"
    end
  end
end
