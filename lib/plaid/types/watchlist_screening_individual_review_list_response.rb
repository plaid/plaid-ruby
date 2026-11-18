# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Paginated list of screening reviews
    class WatchlistScreeningIndividualReviewListResponse < Internal::Types::Model
      field :watchlist_screening_reviews, -> { Internal::Types::Array[Plaid::Types::WatchlistScreeningReview] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
