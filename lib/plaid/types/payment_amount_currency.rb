# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentAmountCurrency
      extend Plaid::Internal::Types::Enum

      GBP = "GBP"
      EUR = "EUR"
      PLN = "PLN"
      SEK = "SEK"
      DKK = "DKK"
      NOK = "NOK"
    end
  end
end
