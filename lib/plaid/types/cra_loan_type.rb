# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraLoanType
      extend Plaid::Internal::Types::Enum

      PERSONAL = "PERSONAL"
      CREDIT_CARD = "CREDIT_CARD"
      BUSINESS = "BUSINESS"
      MORTGAGE = "MORTGAGE"
      AUTO = "AUTO"
      PAYDAY = "PAYDAY"
      STUDENT = "STUDENT"
      HOME_EQUITY = "HOME_EQUITY"
      OTHER = "OTHER"
    end
  end
end
