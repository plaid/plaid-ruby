# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Used to configure Sandbox test data for the Liabilities product
    class LiabilityOverride < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :purchase_apr, -> { Float }, optional: true, nullable: false

      field :cash_apr, -> { Float }, optional: true, nullable: false

      field :balance_transfer_apr, -> { Float }, optional: true, nullable: false

      field :special_apr, -> { Float }, optional: true, nullable: false

      field :last_payment_amount, -> { Float }, optional: true, nullable: false

      field :last_statement_balance, -> { Float }, optional: true, nullable: false

      field :minimum_payment_amount, -> { Float }, optional: true, nullable: false

      field :is_overdue, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :origination_date, -> { String }, optional: true, nullable: false

      field :principal, -> { Float }, optional: true, nullable: false

      field :nominal_apr, -> { Float }, optional: true, nullable: false

      field :interest_capitalization_grace_period_months, -> { Integer }, optional: true, nullable: false

      field :repayment_model, -> { Plaid::Types::StudentLoanRepaymentModel }, optional: true, nullable: false

      field :expected_payoff_date, -> { String }, optional: true, nullable: false

      field :guarantor, -> { String }, optional: true, nullable: false

      field :is_federal, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :loan_name, -> { String }, optional: true, nullable: false

      field :loan_status, -> { Plaid::Types::StudentLoanStatus }, optional: true, nullable: false

      field :payment_reference_number, -> { String }, optional: true, nullable: false

      field :pslf_status, -> { Plaid::Types::PslfStatus }, optional: true, nullable: false

      field :repayment_plan_description, -> { String }, optional: true, nullable: false

      field :repayment_plan_type, -> { String }, optional: true, nullable: false

      field :sequence_number, -> { Float }, optional: true, nullable: false

      field :servicer_address, -> { Plaid::Types::AddressDataOverride }, optional: true, nullable: false

      field :account_number, -> { String }, optional: true, nullable: false

      field :interest_rate, -> { Plaid::Types::LiabilityOverrideInterestRate }, optional: true, nullable: false

      field :principal_balance, -> { Float }, optional: true, nullable: false

      field :origination_principal_amount, -> { Float }, optional: true, nullable: false

      field :loan_term_months, -> { Integer }, optional: true, nullable: false

      field :maturity_date, -> { String }, optional: true, nullable: false

      field :payment_count, -> { Integer }, optional: true, nullable: false

      field :payment_frequency, -> { String }, optional: true, nullable: false

      field :next_payment_amount, -> { Float }, optional: true, nullable: false

      field :next_payment_due_date, -> { String }, optional: true, nullable: false

      field :last_payment_date, -> { String }, optional: true, nullable: false

      field :payoff_amount, -> { Float }, optional: true, nullable: false

      field :ytd_interest_paid, -> { Float }, optional: true, nullable: false

      field :compounding_period, -> { String }, optional: true, nullable: false

      field :credit_limit, -> { Float }, optional: true, nullable: false

      field :available_credit, -> { Float }, optional: true, nullable: false

      field :last_statement_issue_date, -> { String }, optional: true, nullable: false

      field :past_due_amount, -> { Float }, optional: true, nullable: false

      field :finance_charges, -> { Float }, optional: true, nullable: false

      field :draw_period_end_date, -> { String }, optional: true, nullable: false

      field :aprs, -> { Internal::Types::Array[Plaid::Types::LiabilityOverrideApr] }, optional: true, nullable: false
    end
  end
end
