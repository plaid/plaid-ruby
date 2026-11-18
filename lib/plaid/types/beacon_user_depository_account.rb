# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Depository account information for the associated user.
    class BeaconUserDepositoryAccount < Internal::Types::Model
      field :account_mask, -> { String }, optional: false, nullable: false

      field :routing_number, -> { String }, optional: false, nullable: false

      field :added_at, -> { String }, optional: false, nullable: false
    end
  end
end
