# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Document object with metadata of the uploaded document
    class IdentityDocumentUpload < Internal::Types::Model
      field :document_id, -> { String }, optional: true, nullable: false

      field :metadata, -> { Plaid::Types::IdentityDocumentUploadMetadata }, optional: true, nullable: false

      field :risk_insights, -> { Plaid::Types::IdentityDocumentUploadRiskInsights }, optional: true, nullable: false
    end
  end
end
