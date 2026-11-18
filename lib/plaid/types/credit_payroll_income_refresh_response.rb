# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditPayrollIncomeRefreshResponse defines the response schema for `/credit/payroll_income/refresh`
    class CreditPayrollIncomeRefreshResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :verification_refresh_status, -> { String }, optional: false, nullable: false
    end
  end
end
