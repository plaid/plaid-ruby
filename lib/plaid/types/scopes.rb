# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The scopes object
    class Scopes < Internal::Types::Model
      field :product_access, -> { Plaid::Types::ProductAccess }, optional: true, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::AccountAccess] }, optional: true, nullable: false

      field :new_accounts, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
