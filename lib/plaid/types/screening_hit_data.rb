# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information associated with the watchlist hit
    class ScreeningHitData < Internal::Types::Model
      field :dates_of_birth, -> { Internal::Types::Array[Plaid::Types::ScreeningHitDateOfBirthItem] }, optional: true, nullable: false

      field :documents, -> { Internal::Types::Array[Plaid::Types::ScreeningHitDocumentsItems] }, optional: true, nullable: false

      field :locations, -> { Internal::Types::Array[Plaid::Types::GenericScreeningHitLocationItems] }, optional: true, nullable: false

      field :names, -> { Internal::Types::Array[Plaid::Types::ScreeningHitNamesItems] }, optional: true, nullable: false
    end
  end
end
