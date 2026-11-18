# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The amount and currency of the fraud or attempted fraud.
    # `fraud_amount` should be omitted to indicate an unknown fraud amount.
    class FraudAmount < Internal::Types::Model
      field :iso_currency_code, -> { Plaid::Types::IsoCurrencyCode }, optional: false, nullable: false

      field :value, -> { Float }, optional: false, nullable: false
    end
  end
end
