# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object representing metadata pertaining to the document.
    class CreditDocumentMetadata < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :document_type, -> { String }, optional: false, nullable: true

      field :download_url, -> { String }, optional: false, nullable: true

      field :status, -> { String }, optional: false, nullable: true

      field :page_count, -> { Integer }, optional: true, nullable: true

      field :error_message, -> { String }, optional: true, nullable: true
    end
  end
end
