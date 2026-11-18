# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # IdentityMatchListResponse defines the response schema for `/identity/match/list`
    class IdentityMatchListResponse < Internal::Types::Model
      field :identity_match_attempts, -> { Internal::Types::Array[Plaid::Types::IdentityMatchListAttempt] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: true

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
