# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Income Insights data returned by `/cra/report/get`.
    class CraReportGetIncomeInsightsResponseProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :metadata, -> { Plaid::Types::CraReportGetIncomeInsightsMetadata }, optional: false, nullable: true

      field :attributes, -> { Plaid::Types::CraReportGetIncomeInsightsAttributes }, optional: false, nullable: true

      field :items, -> { Internal::Types::Array[Plaid::Types::CraReportGetIncomeInsightsItem] }, optional: false, nullable: false

      field :errors, -> { Internal::Types::Array[Plaid::Types::PlaidError] }, optional: false, nullable: false
    end
  end
end
