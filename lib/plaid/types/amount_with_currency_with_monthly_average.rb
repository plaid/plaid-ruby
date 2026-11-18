# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents an amount and a monthly average
    class AmountWithCurrencyWithMonthlyAverage < Internal::Types::Model
      field :amount, -> { Float }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true

      field :monthly_average, -> { Plaid::Types::MonthlyAverage }, optional: true, nullable: true
    end
  end
end
