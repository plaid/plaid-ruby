# frozen_string_literal: true

module Plaid
  module WatchlistScreeningIndividual
    module Types
      class WatchlistScreeningIndividualReviewCreateRequest < Internal::Types::Model
        field :confirmed_hits, -> { Internal::Types::Array[String] }, optional: false, nullable: false

        field :dismissed_hits, -> { Internal::Types::Array[String] }, optional: false, nullable: false

        field :comment, -> { String }, optional: true, nullable: true

        field :watchlist_screening_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
