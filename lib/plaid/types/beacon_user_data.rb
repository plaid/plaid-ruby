# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A Beacon User's data and resulting analysis when checked against duplicate records and the Beacon Fraud Network.
    class BeaconUserData < Internal::Types::Model
      field :date_of_birth, -> { String }, optional: false, nullable: false

      field :name, -> { Plaid::Types::BeaconUserName }, optional: false, nullable: false

      field :address, -> { Plaid::Types::BeaconUserAddress }, optional: false, nullable: false

      field :email_address, -> { String }, optional: false, nullable: true

      field :phone_number, -> { String }, optional: false, nullable: true

      field :id_number, -> { Plaid::Types::BeaconUserIDNumber }, optional: false, nullable: true

      field :ip_address, -> { String }, optional: false, nullable: true

      field :depository_accounts, -> { Internal::Types::Array[Plaid::Types::BeaconUserDepositoryAccount] }, optional: false, nullable: false
    end
  end
end
