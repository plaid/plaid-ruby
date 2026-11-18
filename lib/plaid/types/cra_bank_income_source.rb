# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Detailed information for the income source.
    class CraBankIncomeSource < Internal::Types::Model
      field :account_id, -> { String }, optional: true, nullable: false

      field :income_source_id, -> { String }, optional: true, nullable: false

      field :income_description, -> { String }, optional: true, nullable: false

      field :income_category, -> { Plaid::Types::CreditBankIncomeCategory }, optional: true, nullable: false

      field :start_date, -> { String }, optional: true, nullable: false

      field :end_date, -> { String }, optional: true, nullable: false

      field :pay_frequency, -> { Plaid::Types::CreditBankIncomePayFrequency }, optional: true, nullable: false

      field :total_amount, -> { Float }, optional: true, nullable: false

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true

      field :transaction_count, -> { Integer }, optional: true, nullable: false

      field :next_payment_date, -> { String }, optional: true, nullable: true

      field :status, -> { Plaid::Types::CraBankIncomeStatus }, optional: true, nullable: false

      field :historical_average_monthly_gross_income, -> { Float }, optional: true, nullable: true

      field :historical_average_monthly_income, -> { Float }, optional: true, nullable: true

      field :forecasted_average_monthly_income, -> { Float }, optional: true, nullable: true

      field :forecasted_average_monthly_income_prediction_intervals, -> { Internal::Types::Array[Plaid::Types::CraPredictionInterval] }, optional: false, nullable: false

      field :employer, -> { Plaid::Types::CraBankIncomeEmployer }, optional: true, nullable: false

      field :income_provider, -> { Plaid::Types::CraBankIncomeIncomeProvider }, optional: false, nullable: true

      field :historical_summary, -> { Internal::Types::Array[Plaid::Types::CraBankIncomeHistoricalSummary] }, optional: true, nullable: false
    end
  end
end
