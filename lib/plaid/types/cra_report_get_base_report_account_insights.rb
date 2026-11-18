# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights derived from the account's transaction-level data. Omitted if insights were not available.
    class CraReportGetBaseReportAccountInsights < Internal::Types::Model
      field :oldest_transaction_date, -> { String }, optional: false, nullable: true

      field :most_recent_transaction_date, -> { String }, optional: false, nullable: true

      field :average_days_between_transactions, -> { Float }, optional: false, nullable: true

      field :number_of_days_no_transactions, -> { Integer }, optional: false, nullable: false

      field :longest_gaps_between_transactions, -> { Internal::Types::Array[Plaid::Types::CraReportGetBaseReportLongestGapInsight] }, optional: false, nullable: false

      field :number_of_inflows, -> { Internal::Types::Array[Plaid::Types::BaseReportNumberFlowInsights] }, optional: false, nullable: false

      field :number_of_outflows, -> { Internal::Types::Array[Plaid::Types::BaseReportNumberFlowInsights] }, optional: false, nullable: false

      field :average_inflow_amounts, -> { Internal::Types::Array[Plaid::Types::BaseReportAverageFlowInsights] }, optional: false, nullable: false

      field :average_outflow_amounts, -> { Internal::Types::Array[Plaid::Types::BaseReportAverageFlowInsights] }, optional: false, nullable: false
    end
  end
end
