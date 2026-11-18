# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A collection of Bank Accounts linked to an Item that is associated with this Beacon User.
    class BeaconBankAccounts < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::BeaconBankAccountInsights] }, optional: false, nullable: false
    end
  end
end
