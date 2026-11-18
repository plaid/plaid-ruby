# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Characteristics of the banking data used to generate the UltraFICO scores.
    class CraReportGetUltraFicoReportCharacteristics < Internal::Types::Model
      field :num_accounts, -> { Integer }, optional: true, nullable: true

      field :avg_daily_balance_over1month, -> { Float }, optional: true, nullable: true, api_name: "avg_daily_balance_over_1_month"

      field :avg_daily_balance_over3months, -> { Float }, optional: true, nullable: true, api_name: "avg_daily_balance_over_3_months"

      field :avg_daily_balance_over6months, -> { Float }, optional: true, nullable: true, api_name: "avg_daily_balance_over_6_months"

      field :avg_daily_balance_over12months, -> { Float }, optional: true, nullable: true, api_name: "avg_daily_balance_over_12_months"

      field :days_since_earliest_tx, -> { Integer }, optional: true, nullable: true

      field :days_since_most_recent_negative_ending_balance, -> { Integer }, optional: true, nullable: true

      field :days_since_most_recent_insufficient_funds_fee_debit_tx, -> { Integer }, optional: true, nullable: true

      field :tot_number_days_with_negative_balance_over1month, -> { Integer }, optional: true, nullable: true, api_name: "tot_number_days_with_negative_balance_over_1_month"

      field :tot_number_days_with_negative_balance_over3months, -> { Integer }, optional: true, nullable: true, api_name: "tot_number_days_with_negative_balance_over_3_months"

      field :tot_number_days_with_negative_balance_over6months, -> { Integer }, optional: true, nullable: true, api_name: "tot_number_days_with_negative_balance_over_6_months"

      field :tot_number_days_with_negative_balance_over12months, -> { Integer }, optional: true, nullable: true, api_name: "tot_number_days_with_negative_balance_over_12_months"

      field :days_since_most_recent_tx, -> { Integer }, optional: true, nullable: true

      field :days_with_tx_over1month, -> { Integer }, optional: true, nullable: true, api_name: "days_with_tx_over_1_month"

      field :days_with_tx_over3months, -> { Integer }, optional: true, nullable: true, api_name: "days_with_tx_over_3_months"

      field :days_with_tx_over6months, -> { Integer }, optional: true, nullable: true, api_name: "days_with_tx_over_6_months"

      field :days_with_tx_over12months, -> { Integer }, optional: true, nullable: true, api_name: "days_with_tx_over_12_months"

      field :tot_current_balances, -> { Float }, optional: true, nullable: true

      field :num_checking_accounts, -> { Integer }, optional: true, nullable: true

      field :num_money_market_accounts, -> { Integer }, optional: true, nullable: true

      field :num_savings_accounts, -> { Integer }, optional: true, nullable: true
    end
  end
end
