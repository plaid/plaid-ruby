# frozen_string_literal: true

module Plaid
  module Issues
    module Types
      class BetaIssuesV1MatchRequest < Internal::Types::Model
        field :identifier_type, -> { Plaid::Types::BetaIssuesV1MatchIdentifierType }, optional: false, nullable: false

        field :identifier, -> { String }, optional: false, nullable: false
      end
    end
  end
end
