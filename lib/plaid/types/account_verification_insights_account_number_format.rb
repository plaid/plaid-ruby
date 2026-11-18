# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AccountVerificationInsightsAccountNumberFormat
      extend Plaid::Internal::Types::Enum

      VALID = "valid"
      INVALID = "invalid"
      UNKNOWN = "unknown"
    end
  end
end
