# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Search inputs for creating an entity watchlist screening
    class EntityWatchlistSearchTerms < Internal::Types::Model
      field :entity_watchlist_program_id, -> { String }, optional: false, nullable: false

      field :legal_name, -> { String }, optional: false, nullable: false

      field :document_number, -> { String }, optional: true, nullable: true

      field :email_address, -> { String }, optional: true, nullable: true

      field :country, -> { String }, optional: true, nullable: true

      field :phone_number, -> { String }, optional: true, nullable: true

      field :url, -> { String }, optional: true, nullable: true
    end
  end
end
