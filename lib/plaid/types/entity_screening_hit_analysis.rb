# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analysis information describing why a screening hit matched the provided entity information
    class EntityScreeningHitAnalysis < Internal::Types::Model
      field :documents, -> { Plaid::Types::MatchSummaryCode }, optional: true, nullable: false

      field :email_addresses, -> { Plaid::Types::MatchSummaryCode }, optional: true, nullable: false

      field :locations, -> { Plaid::Types::MatchSummaryCode }, optional: true, nullable: false

      field :names, -> { Plaid::Types::MatchSummaryCode }, optional: true, nullable: false

      field :phone_numbers, -> { Plaid::Types::MatchSummaryCode }, optional: true, nullable: false

      field :urls, -> { Plaid::Types::MatchSummaryCode }, optional: true, nullable: false

      field :search_terms_version, -> { Integer }, optional: false, nullable: false
    end
  end
end
