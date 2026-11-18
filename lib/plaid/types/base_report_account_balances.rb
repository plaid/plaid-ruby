# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about an account's balances.
    class BaseReportAccountBalances < Internal::Types::Model
      field :available, -> { Float }, optional: false, nullable: true

      field :current, -> { Float }, optional: false, nullable: true

      field :limit, -> { Float }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :last_updated_datetime, -> { String }, optional: true, nullable: true

      field :average_balance, -> { Float }, optional: true, nullable: true

      field :average_monthly_balances, -> { Internal::Types::Array[Plaid::Types::BaseReportAverageMonthlyBalances] }, optional: true, nullable: false

      field :most_recent_thirty_day_average_balance, -> { Float }, optional: true, nullable: true
    end
  end
end
