# frozen_string_literal: true

module Plaid
  module Transfer
    module Ledger
      module Types
        class TransferLedgerEventListRequest < Internal::Types::Model
          field :originator_client_id, -> { String }, optional: true, nullable: true

          field :start_date, -> { String }, optional: true, nullable: true

          field :end_date, -> { String }, optional: true, nullable: true

          field :ledger_id, -> { String }, optional: true, nullable: true

          field :ledger_event_id, -> { String }, optional: true, nullable: true

          field :source_type, -> { Plaid::Types::LedgerEventSourceType }, optional: true, nullable: true

          field :source_id, -> { String }, optional: true, nullable: true

          field :count, -> { Integer }, optional: true, nullable: true

          field :offset, -> { Integer }, optional: true, nullable: true
        end
      end
    end
  end
end
