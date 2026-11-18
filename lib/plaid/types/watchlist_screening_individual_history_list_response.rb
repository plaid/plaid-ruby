# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Paginated list of individual watchlist screenings.
    class WatchlistScreeningIndividualHistoryListResponse < Internal::Types::Model
      field :watchlist_screenings, -> { Internal::Types::Array[Plaid::Types::WatchlistScreeningIndividual] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
