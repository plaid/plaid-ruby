# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CreditAccountSubtype
      extend Plaid::Internal::Types::Enum

      CREDIT_CARD = "credit card"
      PAYPAL = "paypal"
      ALL = "all"
    end
  end
end
