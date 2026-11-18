# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object containing all risk signals and relevant metadata for a single document
    class SingleDocumentRiskSignal < Internal::Types::Model
      field :document_reference, -> { Plaid::Types::RiskSignalDocumentReference }, optional: false, nullable: false

      field :risk_signals, -> { Internal::Types::Array[Plaid::Types::DocumentRiskSignal] }, optional: false, nullable: false

      field :risk_summary, -> { Plaid::Types::DocumentRiskSummary }, optional: false, nullable: false
    end
  end
end
