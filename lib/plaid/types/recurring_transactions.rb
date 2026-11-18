# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights object for recurring transactions for `/beta/transactions/user_insights/v1/get` endpoint
    class RecurringTransactions < Internal::Types::Model
      field :inflow_streams, -> { Internal::Types::Array[Plaid::Types::RecurringInsightsStream] }, optional: false, nullable: false

      field :outflow_streams, -> { Internal::Types::Array[Plaid::Types::RecurringInsightsStream] }, optional: false, nullable: false
    end
  end
end
