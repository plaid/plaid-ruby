# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the balance of the ledger held with Plaid.
    class TransferLedgerBalance < Internal::Types::Model
      field :available, -> { String }, optional: false, nullable: false

      field :pending, -> { String }, optional: false, nullable: false
    end
  end
end
