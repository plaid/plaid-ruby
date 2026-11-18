# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Search terms for editing an individual watchlist screening
    class UpdateIndividualScreeningRequestSearchTerms < Internal::Types::Model
      field :watchlist_program_id, -> { String }, optional: true, nullable: false

      field :legal_name, -> { String }, optional: true, nullable: false

      field :date_of_birth, -> { String }, optional: true, nullable: false

      field :document_number, -> { String }, optional: true, nullable: false

      field :country, -> { String }, optional: true, nullable: false
    end
  end
end
