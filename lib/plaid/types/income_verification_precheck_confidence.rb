# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IncomeVerificationPrecheckConfidence
      extend Plaid::Internal::Types::Enum

      HIGH = "HIGH"
      LOW = "LOW"
      UNKNOWN = "UNKNOWN"
    end
  end
end
