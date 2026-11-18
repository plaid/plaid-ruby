# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CounterpartyType
      extend Plaid::Internal::Types::Enum

      MERCHANT = "merchant"
      FINANCIAL_INSTITUTION = "financial_institution"
      PAYMENT_APP = "payment_app"
      MARKETPLACE = "marketplace"
      PAYMENT_TERMINAL = "payment_terminal"
      INCOME_SOURCE = "income_source"
    end
  end
end
