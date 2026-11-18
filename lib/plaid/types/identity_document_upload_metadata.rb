# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata pertaining to the document.
    class IdentityDocumentUploadMetadata < Internal::Types::Model
      field :document_type, -> { String }, optional: true, nullable: true

      field :is_account_number_match, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :page_count, -> { Integer }, optional: true, nullable: true

      field :last_updated, -> { String }, optional: true, nullable: false

      field :uploaded_at, -> { String }, optional: true, nullable: false
    end
  end
end
