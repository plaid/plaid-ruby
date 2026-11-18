# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analyzed document information for the associated hit
    class ScreeningHitDocumentsItems < Internal::Types::Model
      field :analysis, -> { Plaid::Types::MatchSummary }, optional: true, nullable: false

      field :data, -> { Plaid::Types::WatchlistScreeningDocument }, optional: true, nullable: false
    end
  end
end
