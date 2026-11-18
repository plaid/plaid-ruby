# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The verified fields from a paystub verification. All fields are provided as reported on the paystub.
    class IncomeSummary < Internal::Types::Model
      field :employer_name, -> { Plaid::Types::EmployerIncomeSummaryFieldString }, optional: false, nullable: false

      field :employee_name, -> { Plaid::Types::EmployeeIncomeSummaryFieldString }, optional: false, nullable: false

      field :ytd_gross_income, -> { Plaid::Types::YtdGrossIncomeSummaryFieldNumber }, optional: false, nullable: false

      field :ytd_net_income, -> { Plaid::Types::YtdNetIncomeSummaryFieldNumber }, optional: false, nullable: false

      field :pay_frequency, -> { Plaid::Types::PayFrequency }, optional: false, nullable: true

      field :projected_wage, -> { Plaid::Types::ProjectedIncomeSummaryFieldNumber }, optional: false, nullable: false

      field :verified_transaction, -> { Plaid::Types::TransactionData }, optional: false, nullable: true
    end
  end
end
