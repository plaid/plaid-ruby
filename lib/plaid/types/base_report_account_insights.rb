# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Calculated insights derived from transaction-level data. This field has been deprecated in favor of [Base Report
    # attributes aggregated across
    # accounts](https://plaid.com/docs/api/products/check-legacy/#cra-check_report-base_report-get-response-report-attributes)
    # and will be removed in a future release.
    class BaseReportAccountInsights < Internal::Types::Model
      field :oldest_transaction_date, -> { String }, optional: true, nullable: true

      field :most_recent_transaction_date, -> { String }, optional: true, nullable: true

      field :days_available, -> { Integer }, optional: true, nullable: false

      field :average_days_between_transactions, -> { Float }, optional: true, nullable: false

      field :longest_gaps_between_transactions, -> { Internal::Types::Array[Plaid::Types::BaseReportLongestGapInsights] }, optional: true, nullable: false

      field :number_of_inflows, -> { Internal::Types::Array[Plaid::Types::BaseReportNumberFlowInsights] }, optional: true, nullable: false

      field :average_inflow_amounts, -> { Internal::Types::Array[Plaid::Types::BaseReportAverageFlowInsights] }, optional: true, nullable: false

      field :number_of_outflows, -> { Internal::Types::Array[Plaid::Types::BaseReportNumberFlowInsights] }, optional: true, nullable: false

      field :average_outflow_amounts, -> { Internal::Types::Array[Plaid::Types::BaseReportAverageFlowInsights] }, optional: true, nullable: false

      field :number_of_days_no_transactions, -> { Integer }, optional: true, nullable: false
    end
  end
end
