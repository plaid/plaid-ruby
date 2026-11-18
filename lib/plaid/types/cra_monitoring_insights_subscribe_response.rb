# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraMonitoringInsightsSubscribeResponse defines the response schema for `/cra/monitoring_insights/subscribe`
    class CraMonitoringInsightsSubscribeResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :subscription_id, -> { String }, optional: false, nullable: false
    end
  end
end
