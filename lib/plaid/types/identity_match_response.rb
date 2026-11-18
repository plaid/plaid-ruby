# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # IdentityMatchResponse defines the response schema for `/identity/match`
    class IdentityMatchResponse < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::AccountIdentityMatchScore] }, optional: false, nullable: false

      field :item, -> { Plaid::Types::Item }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
