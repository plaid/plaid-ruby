# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IdentityVerificationStatus
      extend Plaid::Internal::Types::Enum

      ACTIVE = "active"
      SUCCESS = "success"
      FAILED = "failed"
      EXPIRED = "expired"
      CANCELED = "canceled"
      PENDING_REVIEW = "pending_review"
    end
  end
end
