# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The transactions data for the end user's income source(s).
    class CreditBankIncomeTransaction < Internal::Types::Model
      field :amount, -> { Float }, optional: true, nullable: false

      field :date, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :original_description, -> { String }, optional: true, nullable: true

      field :pending, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :transaction_id, -> { String }, optional: true, nullable: false

      field :check_number, -> { String }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true
    end
  end
end
