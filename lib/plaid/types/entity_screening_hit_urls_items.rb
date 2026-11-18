# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analyzed URLs for the associated hit
    class EntityScreeningHitURLsItems < Internal::Types::Model
      field :analysis, -> { Plaid::Types::MatchSummary }, optional: true, nullable: false

      field :data, -> { Plaid::Types::EntityScreeningHitURLs }, optional: true, nullable: false
    end
  end
end
