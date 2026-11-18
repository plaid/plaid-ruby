# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # IdentityDocumentsUploadsGetResponse defines the response schema for `/identity/documents/uploads/get`
    class IdentityDocumentsUploadsGetResponse < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::AccountIdentityDocumentUpload] }, optional: false, nullable: false

      field :item, -> { Plaid::Types::Item }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
