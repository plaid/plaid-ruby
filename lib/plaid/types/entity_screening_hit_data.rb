# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information associated with the entity watchlist hit
    class EntityScreeningHitData < Internal::Types::Model
      field :documents, -> { Internal::Types::Array[Plaid::Types::EntityScreeningHitDocumentsItems] }, optional: true, nullable: false

      field :email_addresses, -> { Internal::Types::Array[Plaid::Types::EntityScreeningHitEmailsItems] }, optional: true, nullable: false

      field :locations, -> { Internal::Types::Array[Plaid::Types::GenericScreeningHitLocationItems] }, optional: true, nullable: false

      field :names, -> { Internal::Types::Array[Plaid::Types::EntityScreeningHitNamesItems] }, optional: true, nullable: false

      field :phone_numbers, -> { Internal::Types::Array[Plaid::Types::EntityScreeningHitsPhoneNumberItems] }, optional: true, nullable: false

      field :urls, -> { Internal::Types::Array[Plaid::Types::EntityScreeningHitURLsItems] }, optional: true, nullable: false
    end
  end
end
