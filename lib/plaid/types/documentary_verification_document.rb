# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Images, extracted data, and analysis from a user's identity document
    class DocumentaryVerificationDocument < Internal::Types::Model
      field :status, -> { Plaid::Types::DocumentStatus }, optional: false, nullable: false

      field :attempt, -> { Integer }, optional: false, nullable: false

      field :images, -> { Plaid::Types::PhysicalDocumentImages }, optional: false, nullable: false

      field :extracted_data, -> { Plaid::Types::PhysicalDocumentExtractedData }, optional: false, nullable: true

      field :analysis, -> { Plaid::Types::DocumentAnalysis }, optional: false, nullable: false

      field :redacted_at, -> { String }, optional: false, nullable: true
    end
  end
end
