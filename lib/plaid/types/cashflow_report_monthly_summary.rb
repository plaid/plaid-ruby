# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Monthly summary statistics derived from transaction-level data.
    class CashflowReportMonthlySummary < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: false

      field :end_date, -> { String }, optional: false, nullable: false

      field :starting_balance, -> { Plaid::Types::CashflowReportMonthlySummaryStartingBalance }, optional: false, nullable: true

      field :ending_balance, -> { Plaid::Types::CashflowReportMonthlySummaryEndingBalance }, optional: false, nullable: true

      field :average_daily_ending_balance, -> { Plaid::Types::CashflowReportMonthlySummaryAverageDailyEndingBalance }, optional: false, nullable: false

      field :average_daily_inflow_amount, -> { Plaid::Types::CashflowReportMonthlySummaryAverageDailyInflowAmount }, optional: false, nullable: false

      field :average_daily_outflow_amount, -> { Plaid::Types::CashflowReportMonthlySummaryAverageDailyOutflowAmount }, optional: false, nullable: false

      field :average_daily_net_cashflow_amount, -> { Plaid::Types::CashflowReportMonthlySummaryAverageDailyNetCashflowAmount }, optional: false, nullable: false

      field :average_daily_inflow_transaction_count, -> { Float }, optional: false, nullable: false

      field :average_daily_outflow_transaction_count, -> { Float }, optional: false, nullable: false

      field :total_revenue, -> { Plaid::Types::CashflowReportMonthlySummaryTotalRevenue }, optional: false, nullable: false

      field :total_loan_payment, -> { Plaid::Types::CashflowReportMonthlySummaryTotalLoanPayment }, optional: false, nullable: false

      field :total_variable_expense, -> { Plaid::Types::CashflowReportMonthlySummaryTotalVariableExpense }, optional: false, nullable: false

      field :total_payroll, -> { Plaid::Types::CashflowReportMonthlySummaryTotalPayroll }, optional: false, nullable: false

      field :nsf_transaction_count, -> { Integer }, optional: false, nullable: false

      field :overdraft_transaction_count, -> { Integer }, optional: false, nullable: false

      field :negative_ending_balance_day_count, -> { Integer }, optional: false, nullable: false
    end
  end
end
