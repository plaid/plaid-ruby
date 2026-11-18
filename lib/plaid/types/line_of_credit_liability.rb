# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains details about a line of credit account.
    class LineOfCreditLiability < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :interest_rate, -> { Plaid::Types::LoanInterestRate }, optional: false, nullable: true

      field :credit_limit, -> { Float }, optional: false, nullable: true

      field :available_credit, -> { Float }, optional: false, nullable: true

      field :principal_balance, -> { Float }, optional: false, nullable: true

      field :minimum_payment_amount, -> { Float }, optional: false, nullable: true

      field :next_payment_amount, -> { Float }, optional: false, nullable: true

      field :next_payment_due_date, -> { String }, optional: false, nullable: true

      field :last_payment_amount, -> { Float }, optional: false, nullable: true

      field :last_payment_date, -> { String }, optional: false, nullable: true

      field :last_statement_balance, -> { Float }, optional: false, nullable: true

      field :last_statement_issue_date, -> { String }, optional: false, nullable: true

      field :past_due_amount, -> { Float }, optional: false, nullable: true

      field :finance_charges, -> { Float }, optional: false, nullable: true

      field :draw_period_end_date, -> { String }, optional: false, nullable: true

      field :aprs, -> { Internal::Types::Array[Plaid::Types::Apr] }, optional: false, nullable: false
    end
  end
end
