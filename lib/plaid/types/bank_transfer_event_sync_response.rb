# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/bank_transfer/event/sync`
    class BankTransferEventSyncResponse < Internal::Types::Model
      field :bank_transfer_events, -> { Internal::Types::Array[Plaid::Types::BankTransferEvent] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
