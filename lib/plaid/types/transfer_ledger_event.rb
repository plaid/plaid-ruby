# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents a ledger event in the Transfers API.
    class TransferLedgerEvent < Internal::Types::Model
      field :ledger_event_id, -> { String }, optional: false, nullable: false

      field :ledger_id, -> { String }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :transfer_id, -> { String }, optional: true, nullable: true

      field :refund_id, -> { String }, optional: true, nullable: true

      field :sweep_id, -> { String }, optional: true, nullable: true

      field :description, -> { String }, optional: false, nullable: false

      field :pending_balance, -> { String }, optional: false, nullable: false

      field :available_balance, -> { String }, optional: false, nullable: false

      field :type, -> { String }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false
    end
  end
end
