# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing data from a paystub.
    class PaystubOverride < Internal::Types::Model
      field :employer, -> { Plaid::Types::PaystubOverrideEmployer }, optional: true, nullable: false

      field :employee, -> { Plaid::Types::PaystubOverrideEmployee }, optional: true, nullable: false

      field :income_breakdown, -> { Internal::Types::Array[Plaid::Types::IncomeBreakdown] }, optional: true, nullable: false

      field :net_pay, -> { Plaid::Types::PaystubOverrideNetPay }, optional: true, nullable: false

      field :deductions, -> { Plaid::Types::PaystubOverrideDeductions }, optional: true, nullable: false

      field :earnings, -> { Plaid::Types::PaystubOverrideEarnings }, optional: true, nullable: false

      field :pay_period_details, -> { Plaid::Types::PaystubOverridePayPeriodDetails }, optional: true, nullable: false
    end
  end
end
