# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A Beacon User's data which is used to check against duplicate records and the Beacon Fraud Network.
    #
    # In order to create a Beacon User, in addition to the `name`, _either_ the `date_of_birth` _or_ the
    # `depository_accounts` field must be provided.
    class BeaconUserRequestData < Internal::Types::Model
      field :date_of_birth, -> { String }, optional: true, nullable: false

      field :name, -> { Plaid::Types::BeaconUserName }, optional: false, nullable: false

      field :address, -> { Plaid::Types::BeaconUserRequestAddress }, optional: true, nullable: true

      field :email_address, -> { String }, optional: true, nullable: false

      field :phone_number, -> { String }, optional: true, nullable: true

      field :id_number, -> { Plaid::Types::BeaconUserIDNumber }, optional: true, nullable: true

      field :ip_address, -> { String }, optional: true, nullable: true

      field :depository_accounts, -> { Internal::Types::Array[Plaid::Types::BeaconUserRequestDepositoryAccount] }, optional: true, nullable: false
    end
  end
end
