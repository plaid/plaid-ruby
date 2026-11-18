# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines configuration to generate Partner Insights.
    class CraCheckReportCreatePartnerInsightsOptions < Internal::Types::Model
      field :prism_versions, -> { Plaid::Types::PrismVersions }, optional: true, nullable: true

      field :fico, -> { Plaid::Types::CraPartnerInsightsFicoInput }, optional: true, nullable: true
    end
  end
end
