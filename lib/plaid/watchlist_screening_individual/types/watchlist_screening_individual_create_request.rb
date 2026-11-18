# frozen_string_literal: true

module Plaid
  module WatchlistScreeningIndividual
    module Types
      class WatchlistScreeningIndividualCreateRequest < Internal::Types::Model
        field :search_terms, -> { Plaid::Types::WatchlistScreeningRequestSearchTerms }, optional: false, nullable: false

        field :client_user_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
