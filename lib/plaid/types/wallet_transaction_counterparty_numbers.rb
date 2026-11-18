# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The counterparty's bank account numbers. Exactly one of IBAN or Bacs data is required.
    class WalletTransactionCounterpartyNumbers < Internal::Types::Model
      field :bacs, -> { Plaid::Types::WalletTransactionCounterpartyBacs }, optional: true, nullable: false

      field :international, -> { Plaid::Types::WalletTransactionCounterpartyInternational }, optional: true, nullable: true
    end
  end
end
