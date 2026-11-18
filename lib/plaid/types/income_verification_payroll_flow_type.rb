# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IncomeVerificationPayrollFlowType
      extend Plaid::Internal::Types::Enum

      PAYROLL_DIGITAL_INCOME = "payroll_digital_income"
      PAYROLL_DOCUMENT_INCOME = "payroll_document_income"
    end
  end
end
