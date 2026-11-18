# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A representation of a transaction
    class Transaction < Internal::Types::Model
      field :account_owner, -> { String }, optional: false, nullable: true

      field :pending_transaction_id, -> { String }, optional: false, nullable: true

      field :payment_meta, -> { Plaid::Types::PaymentMeta }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :location, -> { Plaid::Types::Location }, optional: false, nullable: false

      field :authorized_date, -> { String }, optional: false, nullable: true

      field :authorized_datetime, -> { String }, optional: false, nullable: true

      field :datetime, -> { String }, optional: false, nullable: true

      field :payment_channel, -> { Plaid::Types::TransactionPaymentChannel }, optional: false, nullable: false

      field :personal_finance_category, -> { Plaid::Types::PersonalFinanceCategory }, optional: true, nullable: true

      field :business_finance_category, -> { Plaid::Types::BusinessFinanceCategory }, optional: true, nullable: true

      field :transaction_code, -> { Plaid::Types::TransactionCode }, optional: false, nullable: true

      field :personal_finance_category_icon_url, -> { String }, optional: true, nullable: false

      field :counterparties, -> { Internal::Types::Array[Plaid::Types::TransactionCounterparty] }, optional: true, nullable: false

      field :merchant_entity_id, -> { String }, optional: true, nullable: true

      field :merchant_category_code, -> { String }, optional: true, nullable: true

      field :running_balance, -> { Float }, optional: true, nullable: true

      field :client_customization, -> { Plaid::Types::ClientCustomization }, optional: true, nullable: true

      field :account_id, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :category, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :category_id, -> { String }, optional: true, nullable: true

      field :check_number, -> { String }, optional: true, nullable: true

      field :date, -> { String }, optional: false, nullable: false

      field :merchant_name, -> { String }, optional: true, nullable: true

      field :original_description, -> { String }, optional: true, nullable: true

      field :pending, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :transaction_id, -> { String }, optional: false, nullable: false

      field :transaction_type, -> { Plaid::Types::TransactionBaseTransactionType }, optional: true, nullable: false

      field :logo_url, -> { String }, optional: true, nullable: true

      field :website, -> { String }, optional: true, nullable: true
    end
  end
end
