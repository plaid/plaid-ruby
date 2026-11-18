# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A sweep returned from the `/sandbox/transfer/sweep/simulate` endpoint.
    # Can be null if there are no transfers to include in a sweep.
    class SimulatedTransferSweep < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :funding_account_id, -> { String }, optional: false, nullable: false

      field :ledger_id, -> { String }, optional: true, nullable: true

      field :created, -> { String }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false

      field :settled, -> { String }, optional: false, nullable: true

      field :expected_funds_available_date, -> { String }, optional: true, nullable: true

      field :status, -> { Plaid::Types::SweepStatus }, optional: true, nullable: true

      field :trigger, -> { Plaid::Types::SweepTrigger }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: false

      field :network_trace_id, -> { String }, optional: true, nullable: true

      field :failure_reason, -> { Plaid::Types::SweepFailure }, optional: true, nullable: true
    end
  end
end
