# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # BetaIssuesV1MatchResponse defines the response schema for `/beta/issues/v1/match`.
    class BetaIssuesV1MatchResponse < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Plaid::Types::BetaIssuesV1Issue] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
