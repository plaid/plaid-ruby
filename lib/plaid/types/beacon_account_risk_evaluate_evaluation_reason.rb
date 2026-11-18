# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BeaconAccountRiskEvaluateEvaluationReason
      extend Plaid::Internal::Types::Enum

      ONBOARDING = "ONBOARDING"
      NEW_ACCOUNT = "NEW_ACCOUNT"
      INFORMATION_CHANGE = "INFORMATION_CHANGE"
      DORMANT_USER = "DORMANT_USER"
      OTHER = "OTHER"
    end
  end
end
