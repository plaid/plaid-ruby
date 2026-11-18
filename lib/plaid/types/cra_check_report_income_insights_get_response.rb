# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraCheckReportIncomeInsightsGetResponse defines the response schema for `/cra/check_report/income_insights/get`.
    class CraCheckReportIncomeInsightsGetResponse < Internal::Types::Model
      field :report, -> { Plaid::Types::CraIncomeInsights }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::CheckReportWarning] }, optional: true, nullable: false
    end
  end
end
