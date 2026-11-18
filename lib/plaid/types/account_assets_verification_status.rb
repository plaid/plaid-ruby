# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AccountAssetsVerificationStatus
      extend Plaid::Internal::Types::Enum

      AUTOMATICALLY_VERIFIED = "automatically_verified"
      PENDING_AUTOMATIC_VERIFICATION = "pending_automatic_verification"
      PENDING_MANUAL_VERIFICATION = "pending_manual_verification"
      MANUALLY_VERIFIED = "manually_verified"
      VERIFICATION_EXPIRED = "verification_expired"
      VERIFICATION_FAILED = "verification_failed"
      DATABASE_MATCHED = "database_matched"
    end
  end
end
