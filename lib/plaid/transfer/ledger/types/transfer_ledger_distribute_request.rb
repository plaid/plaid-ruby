# frozen_string_literal: true

module Plaid
  module Transfer
    module Ledger
      module Types
        class TransferLedgerDistributeRequest < Internal::Types::Model
          field :from_ledger_id, -> { String }, optional: false, nullable: false

          field :to_ledger_id, -> { String }, optional: false, nullable: false

          field :amount, -> { String }, optional: false, nullable: false

          field :idempotency_key, -> { String }, optional: false, nullable: false

          field :description, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
