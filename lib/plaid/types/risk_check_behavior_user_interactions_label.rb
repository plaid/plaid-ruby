# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module RiskCheckBehaviorUserInteractionsLabel
      extend Plaid::Internal::Types::Enum

      GENUINE = "genuine"
      NEUTRAL = "neutral"
      RISKY = "risky"
      NO_DATA = "no_data"
    end
  end
end
