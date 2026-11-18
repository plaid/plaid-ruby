# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A grouping of related transactions
    class TransactionStream < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :stream_id, -> { String }, optional: false, nullable: false

      field :category, -> { Internal::Types::Array[String] }, optional: false, nullable: true

      field :category_id, -> { String }, optional: false, nullable: true

      field :description, -> { String }, optional: false, nullable: false

      field :merchant_name, -> { String }, optional: false, nullable: true

      field :first_date, -> { String }, optional: false, nullable: false

      field :last_date, -> { String }, optional: false, nullable: false

      field :predicted_next_date, -> { String }, optional: true, nullable: true

      field :frequency, -> { Plaid::Types::RecurringTransactionFrequency }, optional: false, nullable: false

      field :transaction_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :average_amount, -> { Plaid::Types::TransactionStreamAmount }, optional: false, nullable: false

      field :last_amount, -> { Plaid::Types::TransactionStreamAmount }, optional: false, nullable: false

      field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :status, -> { Plaid::Types::TransactionStreamStatus }, optional: false, nullable: false

      field :personal_finance_category, -> { Plaid::Types::PersonalFinanceCategory }, optional: true, nullable: true

      field :is_user_modified, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :last_user_modified_datetime, -> { String }, optional: true, nullable: false
    end
  end
end
