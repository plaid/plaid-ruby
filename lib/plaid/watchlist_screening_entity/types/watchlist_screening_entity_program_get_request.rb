# frozen_string_literal: true

module Plaid
  module WatchlistScreeningEntity
    module Types
      class WatchlistScreeningEntityProgramGetRequest < Internal::Types::Model
        field :entity_watchlist_program_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
