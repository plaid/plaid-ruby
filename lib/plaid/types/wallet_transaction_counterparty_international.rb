# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # International Bank Account Number for a Wallet Transaction
    class WalletTransactionCounterpartyInternational < Internal::Types::Model
      field :iban, -> { String }, optional: true, nullable: false
    end
  end
end
