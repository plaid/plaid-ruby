# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Depository account information for the associated user.
    class BeaconUserRequestDepositoryAccount < Internal::Types::Model
      field :account_number, -> { String }, optional: false, nullable: false

      field :routing_number, -> { String }, optional: false, nullable: false
    end
  end
end
