# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsUserInsightsGetResponse defines the response schema for `/beta/transactions/user_insights/v1/get`.
    class TransactionsUserInsightsGetResponse < Internal::Types::Model
      field :user_data_overview, -> { Plaid::Types::UserDataOverview }, optional: false, nullable: false

      field :counterparty_insights, -> { Plaid::Types::CounterpartyInsights }, optional: true, nullable: false

      field :category_insights, -> { Plaid::Types::CategoryInsights }, optional: true, nullable: false

      field :recurring_transactions, -> { Plaid::Types::RecurringTransactions }, optional: true, nullable: false
    end
  end
end
