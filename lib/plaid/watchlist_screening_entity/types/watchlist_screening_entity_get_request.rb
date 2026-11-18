# frozen_string_literal: true

module Plaid
  module WatchlistScreeningEntity
    module Types
      class WatchlistScreeningEntityGetRequest < Internal::Types::Model
        field :entity_watchlist_screening_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
