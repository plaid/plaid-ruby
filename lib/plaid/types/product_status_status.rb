# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ProductStatusStatus
      extend Plaid::Internal::Types::Enum

      HEALTHY = "HEALTHY"
      DEGRADED = "DEGRADED"
      DOWN = "DOWN"
    end
  end
end
