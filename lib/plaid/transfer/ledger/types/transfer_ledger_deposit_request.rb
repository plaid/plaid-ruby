# frozen_string_literal: true

module Plaid
  module Transfer
    module Ledger
      module Types
        class TransferLedgerDepositRequest < Internal::Types::Model
          field :originator_client_id, -> { String }, optional: true, nullable: true

          field :funding_account_id, -> { String }, optional: true, nullable: true

          field :ledger_id, -> { String }, optional: true, nullable: true

          field :amount, -> { String }, optional: false, nullable: false

          field :description, -> { String }, optional: true, nullable: true

          field :idempotency_key, -> { String }, optional: false, nullable: false

          field :network, -> { Plaid::Types::TransferAchNetwork }, optional: false, nullable: false
        end
      end
    end
  end
end
