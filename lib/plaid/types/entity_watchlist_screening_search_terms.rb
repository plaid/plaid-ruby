# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Search terms associated with an entity used for searching against watchlists
    class EntityWatchlistScreeningSearchTerms < Internal::Types::Model
      field :entity_watchlist_program_id, -> { String }, optional: false, nullable: false

      field :legal_name, -> { String }, optional: false, nullable: false

      field :document_number, -> { String }, optional: false, nullable: true

      field :email_address, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: true

      field :phone_number, -> { String }, optional: false, nullable: true

      field :url, -> { String }, optional: false, nullable: true

      field :version, -> { Integer }, optional: false, nullable: false
    end
  end
end
