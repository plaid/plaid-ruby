# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains details about a closed-end loan account.
    class LoanLiability < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :account_number, -> { String }, optional: false, nullable: true

      field :interest_rate, -> { Plaid::Types::LoanInterestRate }, optional: false, nullable: true

      field :principal_balance, -> { Float }, optional: false, nullable: true

      field :origination_principal_amount, -> { Float }, optional: false, nullable: true

      field :origination_date, -> { String }, optional: false, nullable: true

      field :loan_term_months, -> { Integer }, optional: false, nullable: true

      field :maturity_date, -> { String }, optional: false, nullable: true

      field :payment_count, -> { Integer }, optional: false, nullable: true

      field :payment_frequency, -> { Plaid::Types::LoanPaymentFrequency }, optional: false, nullable: true

      field :next_payment_amount, -> { Float }, optional: false, nullable: true

      field :next_payment_due_date, -> { String }, optional: false, nullable: true

      field :last_payment_amount, -> { Float }, optional: false, nullable: true

      field :last_payment_date, -> { String }, optional: false, nullable: true

      field :payoff_amount, -> { Float }, optional: false, nullable: true

      field :ytd_interest_paid, -> { Float }, optional: false, nullable: true

      field :compounding_period, -> { Plaid::Types::LoanCompoundingPeriod }, optional: false, nullable: true
    end
  end
end
