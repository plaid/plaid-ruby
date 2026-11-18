# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # In closed beta. Object representing metadata pertaining to the document.
    class IdentityDocumentMetadata < Internal::Types::Model
      field :is_account_number_match, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :last_updated, -> { String }, optional: true, nullable: false

      field :uploaded_at, -> { String }, optional: true, nullable: false
    end
  end
end
