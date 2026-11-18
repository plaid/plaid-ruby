# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Aggregated summary of all income streams for this user.
    class CraIncomeInsightsUserSummary < Internal::Types::Model
      field :income_metrics, -> { Internal::Types::Array[Plaid::Types::CraIncomeMetrics] }, optional: false, nullable: false
    end
  end
end
