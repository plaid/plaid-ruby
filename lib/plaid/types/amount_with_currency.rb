# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A monetary amount with its associated currency information, supporting both official and unofficial currency
    # codes.
    class AmountWithCurrency < Internal::Types::Model
      field :amount, -> { Float }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true
    end
  end
end
