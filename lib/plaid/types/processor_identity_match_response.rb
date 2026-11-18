# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorIdentityMatchResponse defines the response schema for `/processor/identity/match`
    class ProcessorIdentityMatchResponse < Internal::Types::Model
      field :account, -> { Plaid::Types::AccountIdentityMatchScore }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
