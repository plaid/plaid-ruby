# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configures how the Income Complete product bundle is generated.
    class CraReportCreateIncomeCompleteOptions < Internal::Types::Model
      field :income_insights_filter, -> { Plaid::Types::IncomeInsightsFilter }, optional: true, nullable: true
    end
  end
end
