# frozen_string_literal: true

module Plaid
  module Transfer
    module Event
      module Types
        class TransferEventListRequest < Internal::Types::Model
          field :start_date, -> { String }, optional: true, nullable: true

          field :end_date, -> { String }, optional: true, nullable: true

          field :transfer_id, -> { String }, optional: true, nullable: true

          field :account_id, -> { String }, optional: true, nullable: true

          field :transfer_type, -> { Plaid::Types::TransferEventListTransferType }, optional: true, nullable: true

          field :event_types, -> { Internal::Types::Array[Plaid::Types::TransferEventType] }, optional: true, nullable: false

          field :sweep_id, -> { String }, optional: true, nullable: false

          field :count, -> { Integer }, optional: true, nullable: true

          field :offset, -> { Integer }, optional: true, nullable: true

          field :origination_account_id, -> { String }, optional: true, nullable: true

          field :originator_client_id, -> { String }, optional: true, nullable: true

          field :funding_account_id, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
