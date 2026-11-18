# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BetaIssuesV1IssueStatus
      extend Plaid::Internal::Types::Enum

      USER_ACTION_REQUIRED = "USER_ACTION_REQUIRED"
      BACKLOGGED = "BACKLOGGED"
      LIKELY_TO_BE_PRIORITIZED = "LIKELY_TO_BE_PRIORITIZED"
      IN_PROGRESS = "IN_PROGRESS"
      RESOLVED = "RESOLVED"
      PENDING_NOTIFICATION = "PENDING_NOTIFICATION"
      DATA_PARTNER_NOTIFIED = "DATA_PARTNER_NOTIFIED"
      DATA_PARTNER_FIX_IN_PROGRESS = "DATA_PARTNER_FIX_IN_PROGRESS"
    end
  end
end
