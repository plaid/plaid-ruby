# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module RiskSignalDocumentType
      extend Plaid::Internal::Types::Enum

      UNKNOWN = "UNKNOWN"
      BANK_STATEMENT = "BANK_STATEMENT"
      BENEFITS_STATEMENT = "BENEFITS_STATEMENT"
      BUSINESS_FILING = "BUSINESS_FILING"
      CHECK = "CHECK"
      DRIVING_LICENSE = "DRIVING_LICENSE"
      FINANCIAL_STATEMENT = "FINANCIAL_STATEMENT"
      INVOICE = "INVOICE"
      PAYSLIP = "PAYSLIP"
      SOCIAL_SECURITY_CARD = "SOCIAL_SECURITY_CARD"
      TAX_FORM = "TAX_FORM"
      UTILITY_BILL = "UTILITY_BILL"
    end
  end
end
