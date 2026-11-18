# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object representing fraud risk data of the uploaded document. Only provided when using Identity Document Upload
    # with Fraud Risk enabled.
    class IdentityDocumentUploadRiskInsights < Internal::Types::Model
      field :risk_summary, -> { Plaid::Types::IdentityDocumentUploadRiskSummary }, optional: true, nullable: false

      field :risk_signals, -> { Internal::Types::Array[Plaid::Types::IdentityDocumentUploadRiskSignal] }, optional: true, nullable: false
    end
  end
end
