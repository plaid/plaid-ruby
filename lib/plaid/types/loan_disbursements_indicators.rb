# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights into loan disbursement transactions received by the user, tracking incoming funds from loan providers.
    class LoanDisbursementsIndicators < Internal::Types::Model
      field :amount, -> { Float }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true

      field :category_details, -> { Internal::Types::Array[Plaid::Types::CategoryExpenses] }, optional: false, nullable: false

      field :monthly_average, -> { Plaid::Types::MonthlyAverage }, optional: true, nullable: true

      field :top_providers, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :transactions_count, -> { Integer }, optional: true, nullable: true

      field :monthly_summaries, -> { Internal::Types::Array[Plaid::Types::MonthlySummary] }, optional: false, nullable: false

      field :days_since_last_occurrence, -> { Integer }, optional: true, nullable: true

      field :percentage_of_income, -> { Float }, optional: true, nullable: true
    end
  end
end
