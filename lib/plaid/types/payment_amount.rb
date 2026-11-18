# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The amount and currency of a payment
    class PaymentAmount < Internal::Types::Model
      field :currency, -> { Plaid::Types::PaymentAmountCurrency }, optional: false, nullable: false

      field :value, -> { Float }, optional: false, nullable: false
    end
  end
end
