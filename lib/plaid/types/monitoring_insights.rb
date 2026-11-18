# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the Monitoring Insights for the given Item
    class MonitoringInsights < Internal::Types::Model
      field :income, -> { Plaid::Types::MonitoringIncomeInsights }, optional: false, nullable: false

      field :loans, -> { Plaid::Types::MonitoringLoanInsights }, optional: false, nullable: false
    end
  end
end
