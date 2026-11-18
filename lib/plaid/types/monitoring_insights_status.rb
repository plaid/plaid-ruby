# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module MonitoringInsightsStatus
      extend Plaid::Internal::Types::Enum

      AVAILABLE = "AVAILABLE"
      FAILED = "FAILED"
    end
  end
end
