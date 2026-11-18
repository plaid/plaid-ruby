# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Search terms for editing an entity watchlist screening
    class UpdateEntityScreeningRequestSearchTerms < Internal::Types::Model
      field :entity_watchlist_program_id, -> { String }, optional: false, nullable: false

      field :legal_name, -> { String }, optional: true, nullable: false

      field :document_number, -> { String }, optional: true, nullable: false

      field :email_address, -> { String }, optional: true, nullable: false

      field :country, -> { String }, optional: true, nullable: false

      field :phone_number, -> { String }, optional: true, nullable: false

      field :url, -> { String }, optional: true, nullable: false
    end
  end
end
