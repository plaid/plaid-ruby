# frozen_string_literal: true

module Plaid
  module WatchlistScreeningEntity
    module Types
      class WatchlistScreeningEntityListRequest < Internal::Types::Model
        field :entity_watchlist_program_id, -> { String }, optional: false, nullable: false

        field :client_user_id, -> { String }, optional: true, nullable: false

        field :status, -> { Plaid::Types::WatchlistScreeningStatus }, optional: true, nullable: false

        field :assignee, -> { String }, optional: true, nullable: false

        field :cursor, -> { String }, optional: true, nullable: true
      end
    end
  end
end
