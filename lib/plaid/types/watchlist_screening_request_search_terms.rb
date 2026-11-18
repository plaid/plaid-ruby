# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Search inputs for creating a watchlist screening
    class WatchlistScreeningRequestSearchTerms < Internal::Types::Model
      field :watchlist_program_id, -> { String }, optional: false, nullable: false

      field :legal_name, -> { String }, optional: false, nullable: false

      field :date_of_birth, -> { String }, optional: true, nullable: false

      field :document_number, -> { String }, optional: true, nullable: false

      field :country, -> { String }, optional: true, nullable: false
    end
  end
end
