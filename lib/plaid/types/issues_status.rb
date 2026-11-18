# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IssuesStatus
      extend Plaid::Internal::Types::Enum

      REPORTED = "REPORTED"
      AWAITING_RESOLUTION = "AWAITING_RESOLUTION"
      FIX_IN_PROGRESS = "FIX_IN_PROGRESS"
      FIX_PENDING_VALIDATION = "FIX_PENDING_VALIDATION"
      CANNOT_FIX = "CANNOT_FIX"
      RESOLVED = "RESOLVED"
    end
  end
end
