# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditPayrollIncomeRiskSignalsGetResponse defines the response schema for
    # `/credit/payroll_income/risk_signals/get`
    class CreditPayrollIncomeRiskSignalsGetResponse < Internal::Types::Model
      field :items, -> { Internal::Types::Array[Plaid::Types::PayrollRiskSignalsItem] }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
