# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Calendar-day average of the ending balance.
    class CashflowReportMonthlySummaryAverageDailyEndingBalance < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
