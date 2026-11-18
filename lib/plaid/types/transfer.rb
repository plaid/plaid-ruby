# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents a transfer within the Transfers API.
    class Transfer < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :authorization_id, -> { String }, optional: false, nullable: false

      field :ach_class, -> { Plaid::Types::AchClass }, optional: true, nullable: false

      field :account_id, -> { String }, optional: true, nullable: false

      field :funding_account_id, -> { String }, optional: false, nullable: true

      field :ledger_id, -> { String }, optional: true, nullable: true

      field :type, -> { Plaid::Types::TransferType }, optional: false, nullable: false

      field :user, -> { Plaid::Types::TransferUserInResponse }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :created, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::TransferStatus }, optional: false, nullable: false

      field :sweep_status, -> { Plaid::Types::TransferSweepStatus }, optional: true, nullable: true

      field :network, -> { Plaid::Types::TransferNetwork }, optional: false, nullable: false

      field :wire_details, -> { Plaid::Types::TransferWireDetails }, optional: true, nullable: true

      field :cancellable, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :failure_reason, -> { Plaid::Types::TransferFailure }, optional: false, nullable: true

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: false, nullable: true

      field :origination_account_id, -> { String }, optional: false, nullable: false

      field :guarantee_decision, -> { Plaid::Types::TransferAuthorizationGuaranteeDecision }, optional: false, nullable: true

      field :guarantee_decision_rationale, -> { Plaid::Types::TransferAuthorizationGuaranteeDecisionRationale }, optional: false, nullable: true

      field :guarantee_details, -> { Plaid::Types::TransferGuaranteeDetails }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: false

      field :standard_return_window, -> { String }, optional: false, nullable: true

      field :unauthorized_return_window, -> { String }, optional: false, nullable: true

      field :expected_settlement_date, -> { String }, optional: false, nullable: true

      field :expected_funds_available_date, -> { String }, optional: true, nullable: true

      field :originator_client_id, -> { String }, optional: false, nullable: true

      field :refunds, -> { Internal::Types::Array[Plaid::Types::TransferRefund] }, optional: false, nullable: false

      field :recurring_transfer_id, -> { String }, optional: false, nullable: true

      field :expected_sweep_settlement_schedule, -> { Internal::Types::Array[Plaid::Types::TransferExpectedSweepSettlementScheduleItem] }, optional: true, nullable: false

      field :credit_funds_source, -> { Plaid::Types::TransferCreditFundsSource }, optional: false, nullable: true

      field :facilitator_fee, -> { String }, optional: true, nullable: false

      field :network_trace_id, -> { String }, optional: true, nullable: true
    end
  end
end
