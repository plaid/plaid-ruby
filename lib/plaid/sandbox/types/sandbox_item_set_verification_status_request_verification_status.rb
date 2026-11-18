# frozen_string_literal: true

require_relative "../../../plaid"

module Plaid
  module Sandbox
    module Types
      module SandboxItemSetVerificationStatusRequestVerificationStatus
        extend Plaid::Internal::Types::Enum

        AUTOMATICALLY_VERIFIED = "automatically_verified"
        VERIFICATION_EXPIRED = "verification_expired"
      end
    end
  end
end
