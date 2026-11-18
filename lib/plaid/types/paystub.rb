# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing data extracted from the end user's paystub.
    class Paystub < Internal::Types::Model
      field :deductions, -> { Plaid::Types::Deductions }, optional: false, nullable: false

      field :doc_id, -> { String }, optional: false, nullable: false

      field :earnings, -> { Plaid::Types::Earnings }, optional: false, nullable: false

      field :employee, -> { Plaid::Types::Employee }, optional: false, nullable: false

      field :employer, -> { Plaid::Types::PaystubEmployer }, optional: false, nullable: false

      field :employment_details, -> { Plaid::Types::EmploymentDetails }, optional: true, nullable: false

      field :net_pay, -> { Plaid::Types::NetPay }, optional: false, nullable: false

      field :pay_period_details, -> { Plaid::Types::PayPeriodDetails }, optional: false, nullable: false

      field :paystub_details, -> { Plaid::Types::PaystubDetails }, optional: true, nullable: false

      field :income_breakdown, -> { Internal::Types::Array[Plaid::Types::IncomeBreakdown] }, optional: true, nullable: false

      field :ytd_earnings, -> { Plaid::Types::PaystubYtdDetails }, optional: true, nullable: false
    end
  end
end
