# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with the CRA Income Insights product.
    class LinkTokenCreateRequestCraOptionsIncomeInsights < Internal::Types::Model
      field :income_insights_filter, -> { Plaid::Types::IncomeInsightsFilter }, optional: true, nullable: true

      field :income_insights_version, -> { Plaid::Types::IncomeInsightsVersion }, optional: false, nullable: true
    end
  end
end
