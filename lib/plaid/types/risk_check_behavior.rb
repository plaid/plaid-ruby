# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object specifying values for `behavior` attributes of risk check, when available.
    class RiskCheckBehavior < Internal::Types::Model
      field :user_interactions, -> { Plaid::Types::RiskCheckBehaviorUserInteractionsLabel }, optional: false, nullable: false

      field :fraud_ring_detected, -> { Plaid::Types::RiskCheckBehaviorFraudRingDetectedLabel }, optional: false, nullable: false

      field :bot_detected, -> { Plaid::Types::RiskCheckBehaviorBotDetectedLabel }, optional: false, nullable: false

      field :risk_level, -> { Plaid::Types::RiskLevelWithNoData }, optional: true, nullable: false
    end
  end
end
