# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ItemConsentedDataScope
      extend Plaid::Internal::Types::Enum

      ACCOUNT_BALANCE_INFO = "account_balance_info"
      CONTACT_INFO = "contact_info"
      ACCOUNT_ROUTING_NUMBER = "account_routing_number"
      TRANSACTIONS = "transactions"
      CREDIT_LOAN_INFO = "credit_loan_info"
      INVESTMENTS = "investments"
      PAYROLL_INFO = "payroll_info"
      INCOME_VERIFICATION_PAYSTUBS_INFO = "income_verification_paystubs_info"
      INCOME_VERIFICATION_W2S_INFO = "income_verification_w2s_info"
      INCOME_VERIFICATION_BANK_STATEMENTS = "income_verification_bank_statements"
      INCOME_VERIFICATION_EMPLOYMENT_INFO = "income_verification_employment_info"
      BANK_STATEMENTS = "bank_statements"
      RISK_INFO = "risk_info"
      NETWORK_INSIGHTS_LITE = "network_insights_lite"
      FRAUD_INFO = "fraud_info"
    end
  end
end
