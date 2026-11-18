# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Comprehensive analysis of spending patterns, categorizing expenses into essential, non-essential, and other
    # categories.
    class ExpenditureInsights < Internal::Types::Model
      field :cash_flow, -> { Plaid::Types::AmountWithCurrencyWithMonthlyAverage }, optional: true, nullable: true

      field :total_expenditure, -> { Plaid::Types::ExpenditureSummary }, optional: true, nullable: true

      field :essential_expenditure, -> { Plaid::Types::ExpenditureSummary }, optional: true, nullable: true

      field :non_essential_expenditure, -> { Plaid::Types::ExpenditureSummary }, optional: true, nullable: true

      field :other_expenditure, -> { Plaid::Types::ExpenditureSummary }, optional: true, nullable: true

      field :transfers_out, -> { Plaid::Types::ExpenditureSummary }, optional: true, nullable: true

      field :outlier_transactions, -> { Plaid::Types::OutlierTransactionsInsights }, optional: true, nullable: true
    end
  end
end
