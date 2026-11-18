# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A filter to apply to `depository`-type accounts
    class DepositoryFilter < Internal::Types::Model
      field :account_subtypes, -> { Internal::Types::Array[Plaid::Types::DepositoryAccountSubtype] }, optional: false, nullable: false

      field :limited_purpose_types, -> { Internal::Types::Array[Plaid::Types::LimitedPurposeType] }, optional: true, nullable: false
    end
  end
end
