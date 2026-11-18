# frozen_string_literal: true

module Plaid
  module WatchlistScreeningEntity
    module Types
      class WatchlistScreeningEntityHitListRequest < Internal::Types::Model
        field :entity_watchlist_screening_id, -> { String }, optional: false, nullable: false

        field :cursor, -> { String }, optional: true, nullable: true
      end
    end
  end
end
