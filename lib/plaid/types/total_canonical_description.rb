# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TotalCanonicalDescription
      extend Plaid::Internal::Types::Enum

      BONUS = "BONUS"
      COMMISSION = "COMMISSION"
      OVERTIME = "OVERTIME"
      PAID_TIME_OFF = "PAID TIME OFF"
      REGULAR_PAY = "REGULAR PAY"
      VACATION = "VACATION"
      EMPLOYEE_MEDICARE = "EMPLOYEE MEDICARE"
      FICA = "FICA"
      SOCIAL_SECURITY_EMPLOYEE_TAX = "SOCIAL SECURITY EMPLOYEE TAX"
      MEDICAL = "MEDICAL"
      VISION = "VISION"
      DENTAL = "DENTAL"
      NET_PAY = "NET PAY"
      TAXES = "TAXES"
      NOT_FOUND = "NOT_FOUND"
      OTHER = "OTHER"
    end
  end
end
