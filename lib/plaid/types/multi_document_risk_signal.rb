# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object containing risk signals and relevant metadata for a set of uploaded documents
    class MultiDocumentRiskSignal < Internal::Types::Model
      field :document_references, -> { Internal::Types::Array[Plaid::Types::RiskSignalDocumentReference] }, optional: false, nullable: false

      field :risk_signals, -> { Internal::Types::Array[Plaid::Types::DocumentRiskSignal] }, optional: false, nullable: false
    end
  end
end
