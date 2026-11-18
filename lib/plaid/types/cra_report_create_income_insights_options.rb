# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configures how the Income Insights product is generated.
    class CraReportCreateIncomeInsightsOptions < Internal::Types::Model
      field :income_insights_filter, -> { Plaid::Types::IncomeInsightsFilter }, optional: true, nullable: true
    end
  end
end
