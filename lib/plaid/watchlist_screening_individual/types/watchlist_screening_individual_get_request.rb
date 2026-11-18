# frozen_string_literal: true

module Plaid
  module WatchlistScreeningIndividual
    module Types
      class WatchlistScreeningIndividualGetRequest < Internal::Types::Model
        field :watchlist_screening_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
