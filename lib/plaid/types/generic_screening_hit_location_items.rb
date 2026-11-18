# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analyzed location information for the associated hit
    class GenericScreeningHitLocationItems < Internal::Types::Model
      field :analysis, -> { Plaid::Types::MatchSummary }, optional: true, nullable: false

      field :data, -> { Plaid::Types::WatchlistScreeningHitLocations }, optional: true, nullable: false
    end
  end
end
