# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Network Insights data returned by `/cra/report/get`.
    class CraReportGetNetworkInsightsResponseProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :metadata, -> { Plaid::Types::CraReportGetNetworkInsightsMetadata }, optional: false, nullable: true

      field :attributes, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :errors, -> { Internal::Types::Array[Plaid::Types::PlaidError] }, optional: false, nullable: false
    end
  end
end
