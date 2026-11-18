# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analysis information describing why a screening hit matched the provided user information
    class ScreeningHitAnalysis < Internal::Types::Model
      field :dates_of_birth, -> { Plaid::Types::MatchSummaryCode }, optional: true, nullable: false

      field :documents, -> { Plaid::Types::MatchSummaryCode }, optional: true, nullable: false

      field :locations, -> { Plaid::Types::MatchSummaryCode }, optional: true, nullable: false

      field :names, -> { Plaid::Types::MatchSummaryCode }, optional: true, nullable: false

      field :search_terms_version, -> { Integer }, optional: false, nullable: false
    end
  end
end
