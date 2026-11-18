# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxTransferLedgerWithdrawSimulateRequest < Internal::Types::Model
        field :sweep_id, -> { String }, optional: false, nullable: false

        field :event_type, -> { Plaid::Types::TransferLedgerSweepSimulateEventType }, optional: false, nullable: false

        field :failure_reason, -> { Plaid::Types::TransferFailure }, optional: true, nullable: true
      end
    end
  end
end
