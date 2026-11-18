# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A transaction on the asset report
    class AssetReportTransaction < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :original_description, -> { String }, optional: false, nullable: true

      field :category, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :category_id, -> { String }, optional: true, nullable: true

      field :credit_category, -> { Plaid::Types::CreditCategory }, optional: true, nullable: true

      field :check_number, -> { String }, optional: true, nullable: true

      field :date, -> { String }, optional: false, nullable: false

      field :date_transacted, -> { String }, optional: true, nullable: true

      field :location, -> { Plaid::Types::Location }, optional: true, nullable: true

      field :name, -> { String }, optional: true, nullable: true

      field :merchant_name, -> { String }, optional: true, nullable: true

      field :payment_meta, -> { Plaid::Types::PaymentMeta }, optional: true, nullable: true

      field :pending, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :pending_transaction_id, -> { String }, optional: true, nullable: true

      field :account_owner, -> { String }, optional: true, nullable: true

      field :transaction_id, -> { String }, optional: false, nullable: false

      field :transaction_type, -> { Plaid::Types::AssetReportTransactionType }, optional: true, nullable: true

      field :income_source_id, -> { String }, optional: true, nullable: false
    end
  end
end
