# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to filter `/auth/get` results.
    class AuthGetRequestOptions < Internal::Types::Model
      field :account_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
