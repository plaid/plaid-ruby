# frozen_string_literal: true

module Plaid
  module WatchlistScreeningEntity
    module Types
      class WatchlistScreeningEntityProgramListRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: true
      end
    end
  end
end
