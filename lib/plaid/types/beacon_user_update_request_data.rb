# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A subset of a Beacon User's data which is used to patch the existing identity data associated with a Beacon User.
    # At least one field must be provided. If left unset or null, user data will not be patched.
    class BeaconUserUpdateRequestData < Internal::Types::Model
      field :date_of_birth, -> { String }, optional: true, nullable: false

      field :name, -> { Plaid::Types::BeaconUserNameNullable }, optional: true, nullable: true

      field :address, -> { Plaid::Types::BeaconUserRequestAddressNullable }, optional: true, nullable: true

      field :email_address, -> { String }, optional: true, nullable: false

      field :phone_number, -> { String }, optional: true, nullable: true

      field :id_number, -> { Plaid::Types::BeaconUserIDNumber }, optional: true, nullable: true

      field :ip_address, -> { String }, optional: true, nullable: true

      field :depository_accounts, -> { Internal::Types::Array[Plaid::Types::BeaconUserRequestDepositoryAccount] }, optional: true, nullable: false
    end
  end
end
