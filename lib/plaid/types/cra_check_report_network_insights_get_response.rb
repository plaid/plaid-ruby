# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraCheckReportNetworkInsightsGetResponse defines the response schema for `/cra/check_report/network_insights/get`.
    class CraCheckReportNetworkInsightsGetResponse < Internal::Types::Model
      field :report, -> { Plaid::Types::CraNetworkInsightsReport }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::CheckReportWarning] }, optional: true, nullable: false
    end
  end
end
