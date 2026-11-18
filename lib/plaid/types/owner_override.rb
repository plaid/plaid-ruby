# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data about the owner or owners of an account. Any fields not specified will be filled in with default Sandbox
    # information.
    class OwnerOverride < Internal::Types::Model
      field :names, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :phone_numbers, -> { Internal::Types::Array[Plaid::Types::PhoneNumber] }, optional: true, nullable: false

      field :emails, -> { Internal::Types::Array[Plaid::Types::Email] }, optional: true, nullable: false

      field :addresses, -> { Internal::Types::Array[Plaid::Types::AddressOverride] }, optional: true, nullable: false
    end
  end
end
