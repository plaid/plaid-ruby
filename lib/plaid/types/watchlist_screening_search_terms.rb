# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Search terms for creating an individual watchlist screening
    class WatchlistScreeningSearchTerms < Internal::Types::Model
      field :watchlist_program_id, -> { String }, optional: false, nullable: false

      field :legal_name, -> { String }, optional: false, nullable: false

      field :date_of_birth, -> { String }, optional: false, nullable: true

      field :document_number, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: true

      field :version, -> { Integer }, optional: false, nullable: false
    end
  end
end
