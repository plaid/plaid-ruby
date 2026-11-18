# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PayFrequencyValue
      extend Plaid::Internal::Types::Enum

      MONTHLY = "monthly"
      SEMIMONTHLY = "semimonthly"
      WEEKLY = "weekly"
      BIWEEKLY = "biweekly"
      UNKNOWN = "unknown"
    end
  end
end
