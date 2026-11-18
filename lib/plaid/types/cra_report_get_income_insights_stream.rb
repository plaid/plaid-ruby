# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An income stream detected for the user.
    class CraReportGetIncomeInsightsStream < Internal::Types::Model
      field :income_stream_id, -> { String }, optional: false, nullable: false

      field :start_date, -> { String }, optional: false, nullable: true

      field :end_date, -> { String }, optional: false, nullable: true

      field :description, -> { String }, optional: false, nullable: true

      field :insights, -> { Plaid::Types::CraIncomeStreamInsights }, optional: false, nullable: false

      field :income_metrics, -> { Plaid::Types::CraIncomeMetrics }, optional: false, nullable: false

      field :transactions, -> { Internal::Types::Array[Plaid::Types::CraIncomeTransaction] }, optional: false, nullable: false
    end
  end
end
