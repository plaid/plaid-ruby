# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Field containing the data used in determining the outcome of the stolen identity risk check.
    #
    # Contains the following fields:
    #
    # `score` - A score from 0 to 100 indicating the likelihood that the user is a stolen identity.
    class RiskCheckStolenIdentity < Internal::Types::Model
      field :score, -> { Integer }, optional: false, nullable: false

      field :risk_level, -> { Plaid::Types::RiskLevel }, optional: true, nullable: false
    end
  end
end
