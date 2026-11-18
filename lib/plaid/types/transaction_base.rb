# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A representation of a transaction
    class TransactionBase < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :category, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :category_id, -> { String }, optional: true, nullable: true

      field :check_number, -> { String }, optional: true, nullable: true

      field :date, -> { String }, optional: false, nullable: false

      field :location, -> { Plaid::Types::Location }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :merchant_name, -> { String }, optional: true, nullable: true

      field :original_description, -> { String }, optional: true, nullable: true

      field :payment_meta, -> { Plaid::Types::PaymentMeta }, optional: true, nullable: false

      field :pending, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :pending_transaction_id, -> { String }, optional: true, nullable: true

      field :account_owner, -> { String }, optional: true, nullable: true

      field :transaction_id, -> { String }, optional: false, nullable: false

      field :transaction_type, -> { Plaid::Types::TransactionBaseTransactionType }, optional: true, nullable: false

      field :logo_url, -> { String }, optional: true, nullable: true

      field :website, -> { String }, optional: true, nullable: true
    end
  end
end
