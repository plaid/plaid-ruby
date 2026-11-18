# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Risk summary of an uploaded document.
    class IdentityDocumentUploadRiskSummary < Internal::Types::Model
      field :risk_score, -> { Integer }, optional: true, nullable: true
    end
  end
end
