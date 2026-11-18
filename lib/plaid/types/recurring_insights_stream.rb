# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights object for recurring transactions streams.
    class RecurringInsightsStream < Internal::Types::Model
      field :stream_id, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :merchant_name, -> { String }, optional: false, nullable: false

      field :oldest_transaction_date, -> { String }, optional: true, nullable: false

      field :newest_transaction_date, -> { String }, optional: true, nullable: false

      field :average_days_apart, -> { Float }, optional: false, nullable: false

      field :frequency, -> { Plaid::Types::RecurringTransactionFrequency }, optional: true, nullable: false

      field :transaction_count, -> { Integer }, optional: true, nullable: false

      field :transaction_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :average_amount, -> { Plaid::Types::TransactionStreamAmount }, optional: true, nullable: false

      field :newest_transaction_amount, -> { Plaid::Types::TransactionStreamAmount }, optional: true, nullable: false

      field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :status, -> { Plaid::Types::TransactionStreamStatus }, optional: true, nullable: false

      field :personal_finance_category_primary, -> { String }, optional: true, nullable: false

      field :personal_finance_category_detailed, -> { String }, optional: true, nullable: false
    end
  end
end
