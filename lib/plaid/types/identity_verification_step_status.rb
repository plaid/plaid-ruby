# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IdentityVerificationStepStatus
      extend Plaid::Internal::Types::Enum

      SUCCESS = "success"
      ACTIVE = "active"
      FAILED = "failed"
      WAITING_FOR_PREREQUISITE = "waiting_for_prerequisite"
      NOT_APPLICABLE = "not_applicable"
      SKIPPED = "skipped"
      EXPIRED = "expired"
      CANCELED = "canceled"
      PENDING_REVIEW = "pending_review"
      MANUALLY_APPROVED = "manually_approved"
      MANUALLY_REJECTED = "manually_rejected"
    end
  end
end
