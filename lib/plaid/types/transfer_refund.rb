# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents a refund within the Transfers API.
    class TransferRefund < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :transfer_id, -> { String }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::TransferRefundStatus }, optional: false, nullable: false

      field :failure_reason, -> { Plaid::Types::TransferRefundFailure }, optional: false, nullable: true

      field :ledger_id, -> { String }, optional: true, nullable: true

      field :created, -> { String }, optional: false, nullable: false

      field :network_trace_id, -> { String }, optional: true, nullable: true
    end
  end
end
