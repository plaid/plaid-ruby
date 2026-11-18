# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # This is a V1 (II1) schema. For the V2 (II2) equivalent, use `CraIncomeInsightsUserSummary`. Summary for income
    # across all income sources and items (max history of 730 days).
    class CraBankIncomeSummary < Internal::Types::Model
      field :total_amounts, -> { Internal::Types::Array[Plaid::Types::CreditAmountWithCurrency] }, optional: true, nullable: false

      field :start_date, -> { String }, optional: true, nullable: false

      field :end_date, -> { String }, optional: true, nullable: false

      field :income_sources_count, -> { Integer }, optional: true, nullable: false

      field :income_categories_count, -> { Integer }, optional: true, nullable: false

      field :income_transactions_count, -> { Integer }, optional: true, nullable: false

      field :historical_average_monthly_gross_income, -> { Internal::Types::Array[Plaid::Types::CreditAmountWithCurrency] }, optional: true, nullable: false

      field :historical_average_monthly_income, -> { Internal::Types::Array[Plaid::Types::CreditAmountWithCurrency] }, optional: true, nullable: false

      field :forecasted_average_monthly_income, -> { Internal::Types::Array[Plaid::Types::CreditAmountWithCurrency] }, optional: true, nullable: false

      field :historical_annual_gross_income, -> { Internal::Types::Array[Plaid::Types::CreditAmountWithCurrency] }, optional: true, nullable: false

      field :historical_annual_income, -> { Internal::Types::Array[Plaid::Types::CreditAmountWithCurrency] }, optional: true, nullable: false

      field :forecasted_annual_income, -> { Internal::Types::Array[Plaid::Types::CreditAmountWithCurrency] }, optional: true, nullable: false

      field :historical_summary, -> { Internal::Types::Array[Plaid::Types::CraBankIncomeHistoricalSummary] }, optional: true, nullable: false
    end
  end
end
