# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ProtectReportSource
      extend Plaid::Internal::Types::Enum

      INTERNAL_REVIEW = "INTERNAL_REVIEW"
      USER_SELF_REPORTED = "USER_SELF_REPORTED"
      BANK_FEEDBACK = "BANK_FEEDBACK"
      NETWORK_FEEDBACK = "NETWORK_FEEDBACK"
      AUTOMATED_SYSTEM = "AUTOMATED_SYSTEM"
      THIRD_PARTY_ALERT = "THIRD_PARTY_ALERT"
      OTHER = "OTHER"
    end
  end
end
