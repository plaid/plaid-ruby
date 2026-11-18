# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # This contains an amount, denominated in the currency specified by either `iso_currency_code` or
    # `unofficial_currency_code`
    class CreditAmountWithCurrency < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
