# frozen_string_literal: true

module Plaid
  module WatchlistScreeningIndividual
    module Types
      class WatchlistScreeningIndividualHitListRequest < Internal::Types::Model
        field :watchlist_screening_id, -> { String }, optional: false, nullable: false

        field :cursor, -> { String }, optional: true, nullable: true
      end
    end
  end
end
