# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module RiskLevelWithNoData
      extend Plaid::Internal::Types::Enum

      LOW = "low"
      MEDIUM = "medium"
      HIGH = "high"
      NO_DATA = "no_data"
    end
  end
end
