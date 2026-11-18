# frozen_string_literal: true

module Plaid
  module WatchlistScreeningEntity
    module Types
      class WatchlistScreeningEntityCreateRequest < Internal::Types::Model
        field :search_terms, -> { Plaid::Types::EntityWatchlistSearchTerms }, optional: false, nullable: false

        field :client_user_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
