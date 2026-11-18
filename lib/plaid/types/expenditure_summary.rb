# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Summary statistics for a specific expenditure category, including total amount, monthly average, and percentage of
    # income.
    class ExpenditureSummary < Internal::Types::Model
      field :amount, -> { Float }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true

      field :monthly_average, -> { Plaid::Types::MonthlyAverage }, optional: true, nullable: true

      field :transactions_count, -> { Integer }, optional: true, nullable: true

      field :percentage_of_income, -> { Float }, optional: true, nullable: true

      field :top_categories, -> { Internal::Types::Array[Plaid::Types::CategoryExpenses] }, optional: false, nullable: false

      field :monthly_summaries, -> { Internal::Types::Array[Plaid::Types::MonthlySummary] }, optional: false, nullable: false
    end
  end
end
