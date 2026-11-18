# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Comprehensive income analysis including total income, income excluding transfers, and inbound transfer amounts.
    class IncomeInsights < Internal::Types::Model
      field :total_income, -> { Plaid::Types::AmountWithCurrencyWithMonthlyAverage }, optional: true, nullable: true

      field :income_excluding_transfers, -> { Plaid::Types::AmountWithCurrencyWithMonthlyAverage }, optional: true, nullable: true

      field :transfers_in, -> { Plaid::Types::AmountWithCurrencyWithMonthlyAverage }, optional: true, nullable: true
    end
  end
end
