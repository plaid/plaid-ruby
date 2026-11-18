# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Summary for bank income across all income sources and items (max history of 730 days).
    class CreditBankIncomeSummary < Internal::Types::Model
      field :total_amount, -> { Float }, optional: true, nullable: false

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true

      field :total_amounts, -> { Internal::Types::Array[Plaid::Types::CreditAmountWithCurrency] }, optional: true, nullable: false

      field :start_date, -> { String }, optional: true, nullable: false

      field :end_date, -> { String }, optional: true, nullable: false

      field :income_sources_count, -> { Integer }, optional: true, nullable: false

      field :income_categories_count, -> { Integer }, optional: true, nullable: false

      field :income_transactions_count, -> { Integer }, optional: true, nullable: false

      field :historical_summary, -> { Internal::Types::Array[Plaid::Types::CreditBankIncomeHistoricalSummary] }, optional: true, nullable: false
    end
  end
end
