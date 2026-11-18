# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Field containing the data used in determining the outcome of the synthetic identity risk check.
    #
    # Contains the following fields:
    #
    # `score` - A score from 0 to 100 indicating the likelihood that the user is a synthetic identity.
    class RiskCheckSyntheticIdentity < Internal::Types::Model
      field :score, -> { Integer }, optional: false, nullable: false

      field :risk_level, -> { Plaid::Types::RiskLevel }, optional: true, nullable: false

      field :first_party_synthetic_fraud, -> { Plaid::Types::SyntheticFraud }, optional: true, nullable: true

      field :third_party_synthetic_fraud, -> { Plaid::Types::SyntheticFraud }, optional: true, nullable: true
    end
  end
end
