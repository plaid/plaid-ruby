# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module VerificationStatus
      extend Plaid::Internal::Types::Enum

      VERIFIED = "VERIFIED"
      UNVERIFIED = "UNVERIFIED"
      NEEDS_INFO = "NEEDS_INFO"
      UNABLE_TO_VERIFY = "UNABLE_TO_VERIFY"
      UNKNOWN = "UNKNOWN"
    end
  end
end
