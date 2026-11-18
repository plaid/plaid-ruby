# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights on the account level. These are only returned for Credit and Depository type accounts.
    class CashflowReportAccountInsights < Internal::Types::Model
      field :historical_balances, -> { Internal::Types::Array[Plaid::Types::CashflowReportHistoricalBalance] }, optional: false, nullable: false

      field :monthly_summaries, -> { Internal::Types::Array[Plaid::Types::CashflowReportMonthlySummary] }, optional: false, nullable: false
    end
  end
end
