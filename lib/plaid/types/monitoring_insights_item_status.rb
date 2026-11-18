# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object with details of the Monitoring Insights Item's status.
    class MonitoringInsightsItemStatus < Internal::Types::Model
      field :status_code, -> { Plaid::Types::MonitoringItemStatusCode }, optional: false, nullable: false

      field :reason, -> { String }, optional: true, nullable: true
    end
  end
end
