# frozen_string_literal: true

module Plaid
  module BankTransfer
    module Event
      module Types
        class BankTransferEventListRequest < Internal::Types::Model
          field :start_date, -> { String }, optional: true, nullable: true

          field :end_date, -> { String }, optional: true, nullable: true

          field :bank_transfer_id, -> { String }, optional: true, nullable: true

          field :account_id, -> { String }, optional: true, nullable: true

          field :bank_transfer_type, -> { Plaid::Types::BankTransferEventListBankTransferType }, optional: true, nullable: true

          field :event_types, -> { Internal::Types::Array[Plaid::Types::BankTransferEventType] }, optional: true, nullable: false

          field :count, -> { Integer }, optional: true, nullable: true

          field :offset, -> { Integer }, optional: true, nullable: true

          field :origination_account_id, -> { String }, optional: true, nullable: true

          field :direction, -> { Plaid::Types::BankTransferEventListDirection }, optional: true, nullable: true
        end
      end
    end
  end
end
