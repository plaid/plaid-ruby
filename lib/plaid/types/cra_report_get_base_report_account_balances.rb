# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The balances of an account in a Base Report.
    class CraReportGetBaseReportAccountBalances < Internal::Types::Model
      field :available, -> { Float }, optional: false, nullable: true

      field :current, -> { Float }, optional: false, nullable: true

      field :limit, -> { Float }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :average_balance, -> { Float }, optional: false, nullable: true

      field :most_recent_thirty_day_average_balance, -> { Float }, optional: false, nullable: true

      field :average_monthly_balances, -> { Internal::Types::Array[Plaid::Types::CraReportGetBaseReportAverageMonthlyBalance] }, optional: false, nullable: false
    end
  end
end
