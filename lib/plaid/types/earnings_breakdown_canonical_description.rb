# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module EarningsBreakdownCanonicalDescription
      extend Plaid::Internal::Types::Enum

      BONUS = "BONUS"
      COMMISSION = "COMMISSION"
      OVERTIME = "OVERTIME"
      PAID_TIME_OFF = "PAID TIME OFF"
      REGULAR_PAY = "REGULAR PAY"
      VACATION = "VACATION"
      BASIC_ALLOWANCE_HOUSING = "BASIC ALLOWANCE HOUSING"
      BASIC_ALLOWANCE_SUBSISTENCE = "BASIC ALLOWANCE SUBSISTENCE"
      OTHER = "OTHER"
    end
  end
end
