# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Location information for the associated watchlist hit
    class WatchlistScreeningHitLocations < Internal::Types::Model
      field :full, -> { String }, optional: false, nullable: false

      field :country, -> { String }, optional: false, nullable: false
    end
  end
end
