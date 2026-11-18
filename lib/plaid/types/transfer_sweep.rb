# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Describes a sweep of funds to / from the sweep account.
    #
    # A sweep is associated with many sweep events (events of type `swept` or `return_swept`) which can be retrieved by
    # invoking the `/transfer/event/list` endpoint with the corresponding `sweep_id`.
    #
    # `swept` events occur when the transfer amount is credited or debited from your sweep account, depending on the
    # `type` of the transfer. `return_swept` events occur when a transfer is returned and Plaid undoes the credit or
    # debit.
    #
    # The total sum of the `swept` and `return_swept` events is equal to the `amount` of the sweep Plaid creates and
    # matches the amount of the entry on your sweep account ledger.
    class TransferSweep < Internal::Types::Model
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
