# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BetaIssuesV1IssueSeverity
      extend Plaid::Internal::Types::Enum

      CRITICAL = "CRITICAL"
      HIGH = "HIGH"
      MEDIUM = "MEDIUM"
      LOW = "LOW"
    end
  end
end
