# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights into gambling-related transactions, including frequency, amounts, and top merchants.
    class GamblingIndicators < Internal::Types::Model
      field :amount, -> { Float }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true

      field :monthly_average, -> { Plaid::Types::MonthlyAverage }, optional: true, nullable: true

      field :top_merchants, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :transactions_count, -> { Integer }, optional: true, nullable: true

      field :monthly_summaries, -> { Internal::Types::Array[Plaid::Types::MonthlySummary] }, optional: false, nullable: false

      field :days_since_last_occurrence, -> { Integer }, optional: true, nullable: true

      field :percentage_of_income, -> { Float }, optional: true, nullable: true
    end
  end
end
