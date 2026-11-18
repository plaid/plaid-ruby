# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraCheckReportPartnerInsightsGetResponse defines the response schema for `/cra/check_report/partner_insights/get`.
    class CraCheckReportPartnerInsightsGetResponse < Internal::Types::Model
      field :report, -> { Plaid::Types::CraPartnerInsights }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::CheckReportWarning] }, optional: true, nullable: false
    end
  end
end
