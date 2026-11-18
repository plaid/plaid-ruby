# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains details about a mortgage account.
    class MortgageLiability < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :account_number, -> { String }, optional: false, nullable: true

      field :current_late_fee, -> { Float }, optional: false, nullable: true

      field :escrow_balance, -> { Float }, optional: false, nullable: true

      field :has_pmi, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :has_prepayment_penalty, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :interest_rate, -> { Plaid::Types::MortgageInterestRate }, optional: false, nullable: false

      field :last_payment_amount, -> { Float }, optional: false, nullable: true

      field :last_payment_date, -> { String }, optional: false, nullable: true

      field :loan_type_description, -> { String }, optional: false, nullable: true

      field :loan_term, -> { String }, optional: false, nullable: true

      field :maturity_date, -> { String }, optional: false, nullable: true

      field :next_monthly_payment, -> { Float }, optional: false, nullable: true

      field :next_payment_due_date, -> { String }, optional: false, nullable: true

      field :origination_date, -> { String }, optional: false, nullable: true

      field :origination_principal_amount, -> { Float }, optional: false, nullable: true

      field :past_due_amount, -> { Float }, optional: false, nullable: true

      field :property_address, -> { Plaid::Types::MortgagePropertyAddress }, optional: false, nullable: false

      field :ytd_interest_paid, -> { Float }, optional: false, nullable: true

      field :ytd_principal_paid, -> { Float }, optional: false, nullable: true
    end
  end
end
