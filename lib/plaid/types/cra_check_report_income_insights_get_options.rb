# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Deprecated. This field is no longer accepted for new clients (created on or after 2026-07-01). New clients should
    # specify required products when creating the Consumer Report. Existing integrations may continue to pass `options`.
    class CraCheckReportIncomeInsightsGetOptions < Internal::Types::Model
      field :income_insights_filter, -> { Plaid::Types::IncomeInsightsFilter }, optional: true, nullable: true

      field :income_insights_version, -> { Plaid::Types::IncomeInsightsVersion }, optional: false, nullable: true
    end
  end
end
