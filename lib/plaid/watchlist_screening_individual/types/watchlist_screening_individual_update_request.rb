# frozen_string_literal: true

module Plaid
  module WatchlistScreeningIndividual
    module Types
      class WatchlistScreeningIndividualUpdateRequest < Internal::Types::Model
        field :watchlist_screening_id, -> { String }, optional: false, nullable: false

        field :search_terms, -> { Plaid::Types::UpdateIndividualScreeningRequestSearchTerms }, optional: true, nullable: true

        field :assignee, -> { String }, optional: true, nullable: false

        field :status, -> { Plaid::Types::WatchlistScreeningStatus }, optional: true, nullable: false

        field :client_user_id, -> { String }, optional: true, nullable: false

        field :reset_fields, -> { Internal::Types::Array[Plaid::Types::WatchlistScreeningIndividualUpdateRequestResettableField] }, optional: true, nullable: true
      end
    end
  end
end
