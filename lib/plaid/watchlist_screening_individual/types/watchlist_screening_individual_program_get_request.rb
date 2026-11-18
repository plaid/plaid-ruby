# frozen_string_literal: true

module Plaid
  module WatchlistScreeningIndividual
    module Types
      class WatchlistScreeningIndividualProgramGetRequest < Internal::Types::Model
        field :watchlist_program_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
