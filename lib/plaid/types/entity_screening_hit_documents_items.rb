# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analyzed documents for the associated hit
    class EntityScreeningHitDocumentsItems < Internal::Types::Model
      field :analysis, -> { Plaid::Types::MatchSummary }, optional: true, nullable: false

      field :data, -> { Plaid::Types::EntityDocument }, optional: true, nullable: false
    end
  end
end
