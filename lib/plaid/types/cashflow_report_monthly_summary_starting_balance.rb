# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The starting balance of the month. This will be the same as the ending balance of the previous month. This field
    # will not be available for the first monthly summary.
    class CashflowReportMonthlySummaryStartingBalance < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
