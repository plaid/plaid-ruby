# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object containing metadata for the document
    class RiskSignalDocumentReference < Internal::Types::Model
      field :document_id, -> { String }, optional: true, nullable: true

      field :document_name, -> { String }, optional: true, nullable: false

      field :status, -> { Plaid::Types::RiskSignalDocumentStatus }, optional: true, nullable: false

      field :document_type, -> { Plaid::Types::RiskSignalDocumentType }, optional: true, nullable: true

      field :file_type, -> { Plaid::Types::RiskSignalFileType }, optional: true, nullable: true
    end
  end
end
