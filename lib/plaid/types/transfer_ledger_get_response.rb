# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/ledger/get`
    class TransferLedgerGetResponse < Internal::Types::Model
      field :ledger_id, -> { String }, optional: false, nullable: false

      field :balance, -> { Plaid::Types::TransferLedgerBalance }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :is_default, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
