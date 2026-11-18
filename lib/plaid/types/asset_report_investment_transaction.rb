# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A transaction within an investment account.
    class AssetReportInvestmentTransaction < Internal::Types::Model
      field :investment_transaction_id, -> { String }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :security_id, -> { String }, optional: false, nullable: true

      field :date, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: true

      field :quantity, -> { Float }, optional: false, nullable: true

      field :amount, -> { Float }, optional: false, nullable: true

      field :price, -> { Float }, optional: false, nullable: true

      field :fees, -> { Float }, optional: false, nullable: true

      field :type, -> { Plaid::Types::InvestmentTransactionType }, optional: false, nullable: true

      field :subtype, -> { Plaid::Types::InvestmentTransactionSubtype }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
