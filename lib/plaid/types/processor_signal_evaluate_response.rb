# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorSignalEvaluateResponse defines the response schema for `/processor/signal/evaluate`
    class ProcessorSignalEvaluateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :scores, -> { Plaid::Types::SignalScores }, optional: false, nullable: true

      field :core_attributes, -> { Plaid::Types::SignalEvaluateCoreAttributes }, optional: true, nullable: false

      field :ruleset, -> { Plaid::Types::Ruleset }, optional: true, nullable: true

      field :warnings, -> { Internal::Types::Array[Plaid::Types::SignalWarning] }, optional: true, nullable: false
    end
  end
end
