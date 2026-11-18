# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The average daily net cash flow amount, calculated as total daily inflows less total daily outflows.
    class CashflowReportMonthlySummaryAverageDailyNetCashflowAmount < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
