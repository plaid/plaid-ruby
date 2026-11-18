# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Paginated list of entity watchlist screening reviews
    class WatchlistScreeningEntityReviewListResponse < Internal::Types::Model
      field :entity_watchlist_screening_reviews, -> { Internal::Types::Array[Plaid::Types::EntityWatchlistScreeningReview] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
