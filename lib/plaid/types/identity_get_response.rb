# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # IdentityGetResponse defines the response schema for `/identity/get`
    class IdentityGetResponse < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::AccountIdentity] }, optional: false, nullable: false

      field :item, -> { Plaid::Types::Item }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
