# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The end user's monthly summary for the income source(s).
    class CreditBankIncomeHistoricalSummary < Internal::Types::Model
      field :total_amount, -> { Float }, optional: true, nullable: false

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true

      field :total_amounts, -> { Internal::Types::Array[Plaid::Types::CreditAmountWithCurrency] }, optional: true, nullable: false

      field :start_date, -> { String }, optional: true, nullable: false

      field :end_date, -> { String }, optional: true, nullable: false

      field :transactions, -> { Internal::Types::Array[Plaid::Types::CreditBankIncomeTransaction] }, optional: true, nullable: false
    end
  end
end
