# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The counterparty's bank account numbers.
    class WalletTransactionCounterpartyNumbersInResponse < Internal::Types::Model
      field :bacs, -> { Plaid::Types::WalletTransactionCounterpartyBacsInResponse }, optional: true, nullable: false

      field :international, -> { Plaid::Types::WalletTransactionCounterpartyInternational }, optional: true, nullable: true
    end
  end
end
