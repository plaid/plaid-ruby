# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Field containing the data used in determining the outcome of a synthetic fraud risk check.
    class SyntheticFraud < Internal::Types::Model
      field :risk_level, -> { Plaid::Types::RiskLevel }, optional: false, nullable: false
    end
  end
end
