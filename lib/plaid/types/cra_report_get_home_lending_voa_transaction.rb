# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A transaction in a Home Lending VOA report returned by `/cra/report/get`. Employment Refresh contains only
    # deposits and omits VOA-only fields.
    class CraReportGetHomeLendingVoaTransaction < Internal::Types::Model
      field :transaction_id, -> { String }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true

      field :original_description, -> { String }, optional: false, nullable: true

      field :merchant_name, -> { String }, optional: true, nullable: true

      field :credit_category, -> { Plaid::Types::CreditCategory }, optional: true, nullable: true

      field :check_number, -> { String }, optional: true, nullable: true

      field :date, -> { String }, optional: false, nullable: false

      field :date_transacted, -> { String }, optional: true, nullable: true

      field :pending, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :account_owner, -> { String }, optional: true, nullable: true

      field :location, -> { Plaid::Types::Location }, optional: true, nullable: true
    end
  end
end
