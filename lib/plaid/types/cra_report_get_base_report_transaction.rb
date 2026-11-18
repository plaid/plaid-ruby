# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A transaction in a Base Report returned by `/cra/report/get`.
    class CraReportGetBaseReportTransaction < Internal::Types::Model
      field :transaction_id, -> { String }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :original_description, -> { String }, optional: false, nullable: true

      field :merchant_name, -> { String }, optional: false, nullable: true

      field :credit_category, -> { Plaid::Types::CreditCategory }, optional: false, nullable: true

      field :check_number, -> { String }, optional: false, nullable: true

      field :date, -> { String }, optional: false, nullable: false

      field :date_transacted, -> { String }, optional: false, nullable: true

      field :pending, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :account_owner, -> { String }, optional: false, nullable: true

      field :location, -> { Plaid::Types::Location }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: true

      field :category, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :category_id, -> { String }, optional: true, nullable: true

      field :personal_finance_category, -> { Plaid::Types::PersonalFinanceCategory }, optional: true, nullable: true
    end
  end
end
