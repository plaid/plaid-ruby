# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the income subcategory of the report
    class MonitoringIncomeInsights < Internal::Types::Model
      field :total_monthly_income, -> { Plaid::Types::TotalMonthlyIncomeInsights }, optional: false, nullable: false

      field :income_sources_counts, -> { Plaid::Types::IncomeSourcesCounts }, optional: false, nullable: false

      field :forecasted_monthly_income, -> { Plaid::Types::ForecastedMonthlyIncome }, optional: false, nullable: false

      field :historical_annual_income, -> { Plaid::Types::HistoricalAnnualIncome }, optional: false, nullable: false

      field :income_sources, -> { Internal::Types::Array[Plaid::Types::MonitoringIncomeSource] }, optional: false, nullable: false
    end
  end
end
