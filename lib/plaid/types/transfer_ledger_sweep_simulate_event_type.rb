# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferLedgerSweepSimulateEventType
      extend Plaid::Internal::Types::Enum

      SWEEP_POSTED = "sweep.posted"
      SWEEP_SETTLED = "sweep.settled"
      SWEEP_RETURNED = "sweep.returned"
      SWEEP_FAILED = "sweep.failed"
      SWEEP_FUNDS_AVAILABLE = "sweep.funds_available"
    end
  end
end
