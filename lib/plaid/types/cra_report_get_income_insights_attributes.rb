# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Income Insights attribute data returned by `/cra/report/get`.
    class CraReportGetIncomeInsightsAttributes < Internal::Types::Model
      field :income_streams, -> { Internal::Types::Array[Plaid::Types::CraReportGetIncomeInsightsStream] }, optional: false, nullable: false

      field :user_summary, -> { Plaid::Types::CraIncomeInsightsUserSummary }, optional: false, nullable: true
    end
  end
end
