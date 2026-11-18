# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Paginated list of entity watchlist screenings
    class WatchlistScreeningEntityHistoryListResponse < Internal::Types::Model
      field :entity_watchlist_screenings, -> { Internal::Types::Array[Plaid::Types::EntityWatchlistScreening] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
