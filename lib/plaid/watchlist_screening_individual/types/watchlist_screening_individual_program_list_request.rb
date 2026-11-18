# frozen_string_literal: true

module Plaid
  module WatchlistScreeningIndividual
    module Types
      class WatchlistScreeningIndividualProgramListRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: true
      end
    end
  end
end
