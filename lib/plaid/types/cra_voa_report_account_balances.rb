# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # VOA Report information about an account's balances.
    class CraVoaReportAccountBalances < Internal::Types::Model
      field :available, -> { Float }, optional: false, nullable: true

      field :current, -> { Float }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :historical_balances, -> { Internal::Types::Array[Plaid::Types::CraVoaReportAccountHistoricalBalance] }, optional: false, nullable: false

      field :average_balance30days, -> { Float }, optional: false, nullable: true, api_name: "average_balance_30_days"

      field :average_balance60days, -> { Float }, optional: false, nullable: true, api_name: "average_balance_60_days"

      field :nsf_overdraft_transactions_count, -> { Float }, optional: false, nullable: false
    end
  end
end
