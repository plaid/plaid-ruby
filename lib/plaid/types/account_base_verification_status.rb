# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AccountBaseVerificationStatus
      extend Plaid::Internal::Types::Enum

      AUTOMATICALLY_VERIFIED = "automatically_verified"
      PENDING_AUTOMATIC_VERIFICATION = "pending_automatic_verification"
      PENDING_MANUAL_VERIFICATION = "pending_manual_verification"
      UNSENT = "unsent"
      MANUALLY_VERIFIED = "manually_verified"
      VERIFICATION_EXPIRED = "verification_expired"
      VERIFICATION_FAILED = "verification_failed"
      DATABASE_MATCHED = "database_matched"
      DATABASE_INSIGHTS_PASS = "database_insights_pass"
      DATABASE_INSIGHTS_PASS_WITH_CAUTION = "database_insights_pass_with_caution"
      DATABASE_INSIGHTS_FAIL = "database_insights_fail"
    end
  end
end
