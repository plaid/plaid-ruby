# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analyzed phone numbers for the associated hit
    class EntityScreeningHitsPhoneNumberItems < Internal::Types::Model
      field :analysis, -> { Plaid::Types::MatchSummary }, optional: true, nullable: false

      field :data, -> { Plaid::Types::EntityScreeningHitPhoneNumbers }, optional: true, nullable: false
    end
  end
end
