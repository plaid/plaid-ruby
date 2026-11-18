# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Risk scoring details broken down by risk category. When using a Balance-only ruleset, this object will not be
    # returned.
    class SignalScores < Internal::Types::Model
      field :customer_initiated_return_risk, -> { Plaid::Types::CustomerInitiatedReturnRisk }, optional: true, nullable: false

      field :bank_initiated_return_risk, -> { Plaid::Types::BankInitiatedReturnRisk }, optional: true, nullable: false
    end
  end
end
