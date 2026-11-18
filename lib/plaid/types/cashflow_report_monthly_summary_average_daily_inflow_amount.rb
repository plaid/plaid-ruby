# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The average daily sum of inflow transactions, calculated over the month. Always represented as a positive monetary
    # amount.
    class CashflowReportMonthlySummaryAverageDailyInflowAmount < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
