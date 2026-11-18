# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Paginated list of individual watchlist screening programs
    class WatchlistScreeningIndividualProgramListResponse < Internal::Types::Model
      field :watchlist_programs, -> { Internal::Types::Array[Plaid::Types::IndividualWatchlistProgram] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
