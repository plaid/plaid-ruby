# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object containing fraud risk data for a set of income documents.
    class DocumentRiskSignalsObject < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: true

      field :single_document_risk_signals, -> { Internal::Types::Array[Plaid::Types::SingleDocumentRiskSignal] }, optional: false, nullable: false

      field :multi_document_risk_signals, -> { Internal::Types::Array[Plaid::Types::MultiDocumentRiskSignal] }, optional: false, nullable: false
    end
  end
end
