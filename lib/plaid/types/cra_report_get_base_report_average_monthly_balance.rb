# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The average balance of an account over one calendar month.
    class CraReportGetBaseReportAverageMonthlyBalance < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: false

      field :end_date, -> { String }, optional: false, nullable: false

      field :average_balance, -> { Plaid::Types::CreditAmountWithCurrency }, optional: false, nullable: false
    end
  end
end
