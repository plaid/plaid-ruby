# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Home Lending attribute data returned by `/cra/report/get`.
    class CraReportGetHomeLendingAttributes < Internal::Types::Model
      field :income_metrics, -> { Internal::Types::Array[Plaid::Types::CraReportGetHomeLendingIncomeMetrics] }, optional: false, nullable: false

      field :income_by_categories, -> { Internal::Types::Array[Plaid::Types::CraReportGetHomeLendingIncomeByCategories] }, optional: false, nullable: false

      field :income_sources, -> { Plaid::Types::CraReportGetHomeLendingIncomeSources }, optional: false, nullable: true

      field :loan_payments_cash_advance_count90d, -> { Integer }, optional: false, nullable: false, api_name: "loan_payments_cash_advance_count_90d"

      field :loan_payments_bnpl_count90d, -> { Integer }, optional: false, nullable: false, api_name: "loan_payments_bnpl_count_90d"

      field :payment_behavior_nsf_late_fees_flag90d, -> { Integer }, optional: false, nullable: false, api_name: "payment_behavior_nsf_late_fees_flag_90d"
    end
  end
end
