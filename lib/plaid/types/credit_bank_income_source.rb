# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Detailed information for the income source.
    class CreditBankIncomeSource < Internal::Types::Model
      field :income_source_id, -> { String }, optional: true, nullable: false

      field :income_description, -> { String }, optional: true, nullable: false

      field :income_category, -> { Plaid::Types::CreditBankIncomeCategory }, optional: true, nullable: false

      field :account_id, -> { String }, optional: true, nullable: false

      field :start_date, -> { String }, optional: true, nullable: false

      field :end_date, -> { String }, optional: true, nullable: false

      field :pay_frequency, -> { Plaid::Types::CreditBankIncomePayFrequency }, optional: true, nullable: false

      field :total_amount, -> { Float }, optional: true, nullable: false

      field :transaction_count, -> { Integer }, optional: true, nullable: false

      field :historical_summary, -> { Internal::Types::Array[Plaid::Types::CreditBankIncomeHistoricalSummary] }, optional: true, nullable: false
    end
  end
end
