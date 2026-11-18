# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SignalEvaluateResponse defines the response schema for `/signal/evaluate`
    class SignalEvaluateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :scores, -> { Plaid::Types::SignalScores }, optional: false, nullable: true

      field :core_attributes, -> { Plaid::Types::SignalEvaluateCoreAttributes }, optional: true, nullable: false

      field :risk_profile, -> { Plaid::Types::RiskProfile }, optional: true, nullable: true

      field :ruleset, -> { Plaid::Types::Ruleset }, optional: true, nullable: true

      field :warnings, -> { Internal::Types::Array[Plaid::Types::SignalWarning] }, optional: false, nullable: false
    end
  end
end
