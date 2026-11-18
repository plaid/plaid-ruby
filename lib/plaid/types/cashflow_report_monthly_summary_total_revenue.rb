# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The total amount of all revenue transactions during this month.
    class CashflowReportMonthlySummaryTotalRevenue < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
