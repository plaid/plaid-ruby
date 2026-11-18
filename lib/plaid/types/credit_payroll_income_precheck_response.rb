# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/credit/payroll_income/precheck`.
    class CreditPayrollIncomePrecheckResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :confidence, -> { Plaid::Types::IncomeVerificationPrecheckConfidence }, optional: false, nullable: false
    end
  end
end
