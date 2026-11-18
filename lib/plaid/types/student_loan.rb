# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains details about a student loan account
    class StudentLoan < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: true

      field :account_number, -> { String }, optional: false, nullable: true

      field :disbursement_dates, -> { Internal::Types::Array[String] }, optional: false, nullable: true

      field :expected_payoff_date, -> { String }, optional: false, nullable: true

      field :guarantor, -> { String }, optional: false, nullable: true

      field :interest_rate_percentage, -> { Float }, optional: false, nullable: false

      field :is_overdue, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :last_payment_amount, -> { Float }, optional: false, nullable: true

      field :last_payment_date, -> { String }, optional: false, nullable: true

      field :last_statement_balance, -> { Float }, optional: true, nullable: true

      field :last_statement_issue_date, -> { String }, optional: false, nullable: true

      field :loan_name, -> { String }, optional: false, nullable: true

      field :loan_status, -> { Plaid::Types::StudentLoanStatus }, optional: false, nullable: false

      field :minimum_payment_amount, -> { Float }, optional: false, nullable: true

      field :next_payment_due_date, -> { String }, optional: false, nullable: true

      field :origination_date, -> { String }, optional: false, nullable: true

      field :origination_principal_amount, -> { Float }, optional: false, nullable: true

      field :outstanding_interest_amount, -> { Float }, optional: false, nullable: true

      field :payment_reference_number, -> { String }, optional: false, nullable: true

      field :pslf_status, -> { Plaid::Types::PslfStatus }, optional: false, nullable: false

      field :repayment_plan, -> { Plaid::Types::StudentRepaymentPlan }, optional: false, nullable: false

      field :sequence_number, -> { String }, optional: false, nullable: true

      field :servicer_address, -> { Plaid::Types::ServicerAddressData }, optional: false, nullable: false

      field :ytd_interest_paid, -> { Float }, optional: false, nullable: true

      field :ytd_principal_paid, -> { Float }, optional: false, nullable: true
    end
  end
end
