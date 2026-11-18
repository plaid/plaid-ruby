# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The ending balance of the month. This will be the same as the starting balance of the next month. This field will
    # not be available for the last monthly summary.
    class CashflowReportMonthlySummaryEndingBalance < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
