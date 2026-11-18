# frozen_string_literal: true

module Plaid
  module WatchlistScreeningEntity
    module Types
      class WatchlistScreeningEntityUpdateRequest < Internal::Types::Model
        field :entity_watchlist_screening_id, -> { String }, optional: false, nullable: false

        field :search_terms, -> { Plaid::Types::UpdateEntityScreeningRequestSearchTerms }, optional: true, nullable: true

        field :assignee, -> { String }, optional: true, nullable: false

        field :status, -> { Plaid::Types::WatchlistScreeningStatus }, optional: true, nullable: false

        field :client_user_id, -> { String }, optional: true, nullable: false

        field :reset_fields, -> { Internal::Types::Array[Plaid::Types::WatchlistScreeningEntityUpdateRequestResettableField] }, optional: true, nullable: true
      end
    end
  end
end
