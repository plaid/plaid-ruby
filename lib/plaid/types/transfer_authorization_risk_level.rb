# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferAuthorizationRiskLevel
      extend Plaid::Internal::Types::Enum

      HIGH_RISK = "HIGH_RISK"
      MEDIUM_HIGH_RISK = "MEDIUM_HIGH_RISK"
      MEDIUM_RISK = "MEDIUM_RISK"
      MEDIUM_LOW_RISK = "MEDIUM_LOW_RISK"
      LOW_RISK = "LOW_RISK"
    end
  end
end
