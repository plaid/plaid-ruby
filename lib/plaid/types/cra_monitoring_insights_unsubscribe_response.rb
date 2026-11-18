# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraMonitoringInsightsUnsubscribeResponse defines the response schema for `/cra/monitoring_insights/unsubscribe`
    class CraMonitoringInsightsUnsubscribeResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
