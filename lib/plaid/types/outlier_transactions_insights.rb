# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights into unusually large transactions that exceed typical spending patterns for the account.
    class OutlierTransactionsInsights < Internal::Types::Model
      field :transactions_count, -> { Integer }, optional: true, nullable: true

      field :total_amount, -> { Plaid::Types::AmountWithCurrency }, optional: true, nullable: true

      field :top_categories, -> { Internal::Types::Array[Plaid::Types::CategoryExpenses] }, optional: false, nullable: false
    end
  end
end
