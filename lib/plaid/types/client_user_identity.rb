# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The identity fields associated with a user. For a user to be eligible for a Plaid Check Consumer Report, all
    # fields are required except `id_numbers`. Providing a partial SSN is strongly recommended, and improves the
    # accuracy of matching user records during compliance processes such as file disclosure, dispute, or security freeze
    # requests. If creating a report that will be shared with GSEs such as Fannie or Freddie, a full Social Security
    # Number must be provided via the `id_numbers` field.
    class ClientUserIdentity < Internal::Types::Model
      field :name, -> { Plaid::Types::ClientUserIdentityName }, optional: true, nullable: true

      field :date_of_birth, -> { String }, optional: true, nullable: true

      field :emails, -> { Internal::Types::Array[Plaid::Types::ClientUserIdentityEmail] }, optional: true, nullable: false

      field :phone_numbers, -> { Internal::Types::Array[Plaid::Types::ClientUserIdentityPhoneNumber] }, optional: true, nullable: false

      field :addresses, -> { Internal::Types::Array[Plaid::Types::ClientUserIdentityAddress] }, optional: true, nullable: false

      field :id_numbers, -> { Internal::Types::Array[Plaid::Types::UserIDNumber] }, optional: true, nullable: false
    end
  end
end
