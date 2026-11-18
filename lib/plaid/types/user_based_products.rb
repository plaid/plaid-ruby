# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module UserBasedProducts
      extend Plaid::Internal::Types::Enum

      CRA_BASE_REPORT = "cra_base_report"
      CRA_INCOME_INSIGHTS = "cra_income_insights"
      CRA_PARTNER_INSIGHTS = "cra_partner_insights"
      CRA_NETWORK_INSIGHTS = "cra_network_insights"
      CRA_CASHFLOW_INSIGHTS = "cra_cashflow_insights"
      CRA_MONITORING = "cra_monitoring"
      CRA_LEND_SCORE = "cra_lend_score"
      CRA_PLAID_CREDIT_SCORE = "cra_plaid_credit_score"
      INVESTMENTS = "investments"
      LIABILITIES = "liabilities"
      PROTECT_LINKED_BANK = "protect_linked_bank"
      PROTECT_TRANSACTIONS = "protect_transactions"
      TRANSACTIONS = "transactions"
    end
  end
end
