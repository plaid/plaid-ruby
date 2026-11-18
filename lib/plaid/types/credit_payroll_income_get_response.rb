# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response body for `/credit/payroll_income/get`.
    class CreditPayrollIncomeGetResponse < Internal::Types::Model
      field :items, -> { Internal::Types::Array[Plaid::Types::PayrollItem] }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
