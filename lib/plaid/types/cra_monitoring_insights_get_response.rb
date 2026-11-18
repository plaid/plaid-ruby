# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraMonitoringInsightsGetResponse defines the response schema for `/cra/monitoring_insights/get`
    class CraMonitoringInsightsGetResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :user_insights_id, -> { String }, optional: false, nullable: false

      field :items, -> { Internal::Types::Array[Plaid::Types::CraMonitoringInsightsItem] }, optional: false, nullable: false
    end
  end
end
