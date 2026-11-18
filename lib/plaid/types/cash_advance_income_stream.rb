# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An income stream returned by `/beta/cash_advance/income_insights/v1/get`.
    class CashAdvanceIncomeStream < Internal::Types::Model
      field :provider_name, -> { String }, optional: false, nullable: true

      field :category, -> { Plaid::Types::CashAdvanceIncomeCategory }, optional: false, nullable: true

      field :pay_frequency, -> { Plaid::Types::CashAdvancePayFrequency }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
