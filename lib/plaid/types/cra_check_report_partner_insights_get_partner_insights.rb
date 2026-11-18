# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Deprecated. This field is no longer accepted for new clients (created on or after 2026-07-01). New clients should
    # specify required products when creating the Consumer Report. Existing integrations may continue to pass
    # `partner_insights`.
    class CraCheckReportPartnerInsightsGetPartnerInsights < Internal::Types::Model
      field :prism_versions, -> { Plaid::Types::PrismVersions }, optional: true, nullable: true

      field :fico, -> { Plaid::Types::CraPartnerInsightsFicoInput }, optional: true, nullable: true
    end
  end
end
