# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analyzed names for the associated hit
    class EntityScreeningHitNamesItems < Internal::Types::Model
      field :analysis, -> { Plaid::Types::MatchSummary }, optional: true, nullable: false

      field :data, -> { Plaid::Types::EntityScreeningHitNames }, optional: true, nullable: false
    end
  end
end
