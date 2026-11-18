# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BetaIssuesV1IssueResolutionType
      extend Plaid::Internal::Types::Enum

      MANUAL_RESOLUTION = "MANUAL_RESOLUTION"
      AUTOMATED_RESOLUTION = "AUTOMATED_RESOLUTION"
    end
  end
end
