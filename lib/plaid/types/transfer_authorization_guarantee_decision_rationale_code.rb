# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferAuthorizationGuaranteeDecisionRationaleCode
      extend Plaid::Internal::Types::Enum

      RETURN_BANK = "RETURN_BANK"
      RETURN_CUSTOMER = "RETURN_CUSTOMER"
      GUARANTEE_LIMIT_REACHED = "GUARANTEE_LIMIT_REACHED"
      RISK_ESTIMATE_UNAVAILABLE = "RISK_ESTIMATE_UNAVAILABLE"
      REQUIRED_PARAM_MISSING = "REQUIRED_PARAM_MISSING"
    end
  end
end
