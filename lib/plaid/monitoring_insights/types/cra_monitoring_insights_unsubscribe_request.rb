# frozen_string_literal: true

module Plaid
  module MonitoringInsights
    module Types
      class CraMonitoringInsightsUnsubscribeRequest < Internal::Types::Model
        field :subscription_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
