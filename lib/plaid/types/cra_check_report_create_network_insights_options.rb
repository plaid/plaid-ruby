# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines configuration options to generate Network Insights
    class CraCheckReportCreateNetworkInsightsOptions < Internal::Types::Model
      field :network_insights_version, -> { Plaid::Types::NetworkInsightsVersion }, optional: true, nullable: true
    end
  end
end
