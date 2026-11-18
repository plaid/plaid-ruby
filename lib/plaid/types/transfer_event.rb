# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents an event in the Transfers API.
    class TransferEvent < Internal::Types::Model
      field :event_id, -> { Integer }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :event_type, -> { Plaid::Types::TransferEventType }, optional: false, nullable: false

      field :account_id, -> { String }, optional: true, nullable: false

      field :funding_account_id, -> { String }, optional: false, nullable: true

      field :ledger_id, -> { String }, optional: true, nullable: true

      field :transfer_id, -> { String }, optional: false, nullable: false

      field :origination_account_id, -> { String }, optional: false, nullable: true

      field :transfer_type, -> { Plaid::Types::OmittableTransferType }, optional: true, nullable: false

      field :transfer_amount, -> { String }, optional: true, nullable: false

      field :failure_reason, -> { Plaid::Types::TransferFailure }, optional: false, nullable: true

      field :sweep_id, -> { String }, optional: false, nullable: true

      field :sweep_amount, -> { String }, optional: false, nullable: true

      field :event_amount, -> { String }, optional: true, nullable: true

      field :refund_id, -> { String }, optional: false, nullable: true

      field :originator_client_id, -> { String }, optional: false, nullable: true

      field :intent_id, -> { String }, optional: true, nullable: true

      field :wire_return_fee, -> { String }, optional: true, nullable: true
    end
  end
end
