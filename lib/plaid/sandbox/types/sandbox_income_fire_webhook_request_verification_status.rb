# frozen_string_literal: true

require_relative "../../../plaid"

module Plaid
  module Sandbox
    module Types
      module SandboxIncomeFireWebhookRequestVerificationStatus
        extend Plaid::Internal::Types::Enum

        VERIFICATION_STATUS_PROCESSING_COMPLETE = "VERIFICATION_STATUS_PROCESSING_COMPLETE"
        VERIFICATION_STATUS_PROCESSING_FAILED = "VERIFICATION_STATUS_PROCESSING_FAILED"
        VERIFICATION_STATUS_DOCUMENT_REJECTED = "VERIFICATION_STATUS_DOCUMENT_REJECTED"
      end
    end
  end
end
