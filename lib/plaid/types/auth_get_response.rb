# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # AuthGetResponse defines the response schema for `/auth/get`
    class AuthGetResponse < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::AccountBase] }, optional: false, nullable: false

      field :numbers, -> { Plaid::Types::AuthGetNumbers }, optional: false, nullable: false

      field :item, -> { Plaid::Types::Item }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
