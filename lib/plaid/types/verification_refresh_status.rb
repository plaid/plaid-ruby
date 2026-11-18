# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module VerificationRefreshStatus
      extend Plaid::Internal::Types::Enum

      VERIFICATION_REFRESH_STATUS_USER_PRESENCE_REQUIRED = "VERIFICATION_REFRESH_STATUS_USER_PRESENCE_REQUIRED"
      VERIFICATION_REFRESH_SUCCESSFUL = "VERIFICATION_REFRESH_SUCCESSFUL"
      VERIFICATION_REFRESH_NOT_FOUND = "VERIFICATION_REFRESH_NOT_FOUND"
    end
  end
end
