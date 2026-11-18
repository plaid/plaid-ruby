# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with the CRA Network Insights product.
    class LinkTokenCreateRequestCraOptionsNetworkInsights < Internal::Types::Model
      field :network_insights_version, -> { Plaid::Types::NetworkInsightsVersion }, optional: true, nullable: true
    end
  end
end
