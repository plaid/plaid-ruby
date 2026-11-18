# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data returned from the financial institution about the owner or owners of an account. Only the `names` array must
    # be non-empty.
    class Owner < Internal::Types::Model
      field :names, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :phone_numbers, -> { Internal::Types::Array[Plaid::Types::PhoneNumber] }, optional: false, nullable: false

      field :emails, -> { Internal::Types::Array[Plaid::Types::Email] }, optional: false, nullable: false

      field :addresses, -> { Internal::Types::Array[Plaid::Types::Address] }, optional: false, nullable: false
    end
  end
end
