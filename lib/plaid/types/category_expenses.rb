# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Detailed expense information for a specific credit category, including transaction count and total amount spent.
    class CategoryExpenses < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :transactions_count, -> { Integer }, optional: true, nullable: true

      field :amount, -> { Float }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true

      field :monthly_average, -> { Plaid::Types::MonthlyAverage }, optional: true, nullable: true
    end
  end
end
