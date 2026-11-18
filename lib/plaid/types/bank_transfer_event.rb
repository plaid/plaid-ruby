# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents an event in the Bank Transfers API.
    class BankTransferEvent < Internal::Types::Model
      field :event_id, -> { Integer }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :event_type, -> { Plaid::Types::BankTransferEventType }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :bank_transfer_id, -> { String }, optional: false, nullable: false

      field :origination_account_id, -> { String }, optional: false, nullable: true

      field :bank_transfer_type, -> { Plaid::Types::BankTransferType }, optional: false, nullable: false

      field :bank_transfer_amount, -> { String }, optional: false, nullable: false

      field :bank_transfer_iso_currency_code, -> { String }, optional: false, nullable: false

      field :failure_reason, -> { Plaid::Types::BankTransferFailure }, optional: false, nullable: true

      field :direction, -> { Plaid::Types::BankTransferDirection }, optional: false, nullable: true

      field :receiver_details, -> { Plaid::Types::ReceiverDetails }, optional: false, nullable: true
    end
  end
end
