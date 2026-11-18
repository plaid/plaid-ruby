# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Risk indicators focus on providing signal on the possibility of a borrower defaulting on their loan repayments by
    # providing data points related to its payment behavior, debt, and other relevant financial information, helping
    # lenders gauge the level of risk involved in a certain operation.
    class RiskIndicators < Internal::Types::Model
      field :bank_penalties, -> { Plaid::Types::BankPenaltiesIndicators }, optional: true, nullable: true

      field :gambling, -> { Plaid::Types::GamblingIndicators }, optional: true, nullable: true

      field :loan_disbursements, -> { Plaid::Types::LoanDisbursementsIndicators }, optional: true, nullable: true

      field :loan_payments, -> { Plaid::Types::LoanPaymentsIndicators }, optional: true, nullable: true

      field :negative_balance, -> { Plaid::Types::NegativeBalanceInsights }, optional: true, nullable: true
    end
  end
end
