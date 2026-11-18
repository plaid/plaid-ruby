# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/ledger/event/list`
    class TransferLedgerEventListResponse < Internal::Types::Model
      field :ledger_events, -> { Internal::Types::Array[Plaid::Types::TransferLedgerEvent] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
