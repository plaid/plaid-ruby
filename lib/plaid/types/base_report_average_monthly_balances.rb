# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Average balance in dollar amount per month
    class BaseReportAverageMonthlyBalances < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: false

      field :end_date, -> { String }, optional: false, nullable: false

      field :average_balance, -> { Plaid::Types::CreditAmountWithCurrency }, optional: false, nullable: false
    end
  end
end
