# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Plaid and FDX-defined recipient metadata fields
    class ExtendedRecipientMetadata < Internal::Types::Model
      field :recipient_id, -> { String }, optional: false, nullable: false

      field :client_name, -> { String }, optional: false, nullable: false

      field :logo_uri, -> { String }, optional: true, nullable: true

      field :third_party_legal_name, -> { String }, optional: false, nullable: false

      field :category, -> { String }, optional: false, nullable: false

      field :joined_date, -> { String }, optional: false, nullable: false

      field :connection_count, -> { Integer }, optional: false, nullable: false
    end
  end
end
