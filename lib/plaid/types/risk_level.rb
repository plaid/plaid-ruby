# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module RiskLevel
      extend Plaid::Internal::Types::Enum

      LOW = "low"
      MEDIUM = "medium"
      HIGH = "high"
    end
  end
end
