# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module MonitoringItemStatusCode
      extend Plaid::Internal::Types::Enum

      AVAILABLE = "AVAILABLE"
      FAILED = "FAILED"
      PENDING = "PENDING"
    end
  end
end
