# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module Products
      extend Plaid::Internal::Types::Enum

      ASSETS = "assets"
      AUTH = "auth"
      BALANCE = "balance"
      BALANCE_PLUS = "balance_plus"
      BEACON = "beacon"
      IDENTITY = "identity"
      IDENTITY_MATCH = "identity_match"
      INVESTMENTS = "investments"
      INVESTMENTS_AUTH = "investments_auth"
      LIABILITIES = "liabilities"
      PAYMENT_INITIATION = "payment_initiation"
      IDENTITY_VERIFICATION = "identity_verification"
      TRANSACTIONS = "transactions"
      CREDIT_DETAILS = "credit_details"
      INCOME = "income"
      INCOME_VERIFICATION = "income_verification"
      STANDING_ORDERS = "standing_orders"
      TRANSFER = "transfer"
      EMPLOYMENT = "employment"
      RECURRING_TRANSACTIONS = "recurring_transactions"
      TRANSACTIONS_REFRESH = "transactions_refresh"
      SIGNAL = "signal"
      STATEMENTS = "statements"
      PROCESSOR_PAYMENTS = "processor_payments"
      PROCESSOR_IDENTITY = "processor_identity"
      PROFILE = "profile"
      CRA_BASE_REPORT = "cra_base_report"
      CRA_INCOME_INSIGHTS = "cra_income_insights"
      CRA_PARTNER_INSIGHTS = "cra_partner_insights"
      CRA_NETWORK_INSIGHTS = "cra_network_insights"
      CRA_CASHFLOW_INSIGHTS = "cra_cashflow_insights"
      CRA_MONITORING = "cra_monitoring"
      CRA_LEND_SCORE = "cra_lend_score"
      CRA_PLAID_CREDIT_SCORE = "cra_plaid_credit_score"
      CRA_QUALIFY = "cra_qualify"
      CRA_HOME_LENDING = "cra_home_lending"
      CRA_LEND_SCORE_COMPLETE = "cra_lend_score_complete"
      CRA_INCOME_COMPLETE = "cra_income_complete"
      CRA_HOME_LENDING_VOA = "cra_home_lending_voa"
      LAYER = "layer"
      PAY_BY_BANK = "pay_by_bank"
      PROTECT_LINKED_BANK = "protect_linked_bank"
      PROTECT_TRANSACTIONS = "protect_transactions"
    end
  end
end
