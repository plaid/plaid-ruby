# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Additional information for the `risk_check` step.
    class RiskCheckDetails < Internal::Types::Model
      field :status, -> { Plaid::Types::IdentityVerificationStepStatus }, optional: false, nullable: false

      field :behavior, -> { Plaid::Types::RiskCheckBehavior }, optional: false, nullable: true

      field :email, -> { Plaid::Types::RiskCheckEmail }, optional: false, nullable: true

      field :phone, -> { Plaid::Types::RiskCheckPhone }, optional: false, nullable: true

      field :devices, -> { Internal::Types::Array[Plaid::Types::RiskCheckDevice] }, optional: false, nullable: false

      field :identity_abuse_signals, -> { Plaid::Types::RiskCheckIdentityAbuseSignals }, optional: false, nullable: true

      field :network, -> { Plaid::Types::RiskCheckNetwork }, optional: true, nullable: true

      field :facial_duplicates, -> { Internal::Types::Array[Plaid::Types::RiskCheckFacialDuplicate] }, optional: false, nullable: false

      field :trust_index_score, -> { Integer }, optional: false, nullable: true
    end
  end
end
