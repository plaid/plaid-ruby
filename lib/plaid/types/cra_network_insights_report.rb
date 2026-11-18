# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains data for the CRA Network Attributes Report.
    class CraNetworkInsightsReport < Internal::Types::Model
      field :report_id, -> { String }, optional: false, nullable: false

      field :generated_time, -> { String }, optional: false, nullable: false

      field :network_attributes, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

      field :items, -> { Internal::Types::Array[Plaid::Types::CraNetworkInsightsItem] }, optional: false, nullable: false
    end
  end
end
