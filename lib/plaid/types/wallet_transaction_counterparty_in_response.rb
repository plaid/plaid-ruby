# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the e-wallet transaction's counterparty
    class WalletTransactionCounterpartyInResponse < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :numbers, -> { Plaid::Types::WalletTransactionCounterpartyNumbersInResponse }, optional: false, nullable: false

      field :address, -> { Plaid::Types::PaymentInitiationAddress }, optional: true, nullable: true

      field :date_of_birth, -> { String }, optional: true, nullable: true
    end
  end
end
