# frozen_string_literal: true

module Plaid
  module Transfer
    module Ledger
      module Types
        class TransferLedgerGetRequest < Internal::Types::Model
          field :ledger_id, -> { String }, optional: true, nullable: true

          field :originator_client_id, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
