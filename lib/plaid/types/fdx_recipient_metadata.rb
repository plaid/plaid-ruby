# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Recipient metadata fields that are defined by FDX.
    class FdxRecipientMetadata < Internal::Types::Model
      field :recipient_id, -> { String }, optional: false, nullable: false

      field :client_name, -> { String }, optional: false, nullable: false

      field :logo_uri, -> { String }, optional: true, nullable: true

      field :third_party_legal_name, -> { String }, optional: false, nullable: false
    end
  end
end
