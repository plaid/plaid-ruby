# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CashflowReportInsightsGetResponse defines the response schema for `/cashflow_report/insights/get`
    class CashflowReportInsightsGetResponse < Internal::Types::Model
      field :item, -> { Plaid::Types::Item }, optional: false, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::BusinessAccount] }, optional: false, nullable: false

      field :account_insights, -> { Plaid::Types::CashflowReportAccountInsights }, optional: false, nullable: false

      field :last_generated_time, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
