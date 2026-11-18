# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/sandbox/transfer/ledger/deposit/simulate`
    class SandboxTransferLedgerDepositSimulateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
