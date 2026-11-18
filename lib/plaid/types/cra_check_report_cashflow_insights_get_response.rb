# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraCheckReportCashflowInsightsGetResponse defines the response schema for
    # `/cra/check_report/cashflow_insights/get`.
    class CraCheckReportCashflowInsightsGetResponse < Internal::Types::Model
      field :report, -> { Plaid::Types::CraCashflowInsightsReport }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::CheckReportWarning] }, optional: true, nullable: false
    end
  end
end
