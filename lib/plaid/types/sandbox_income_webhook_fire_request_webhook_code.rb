# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SandboxIncomeWebhookFireRequestWebhookCode
      extend Plaid::Internal::Types::Enum

      INCOME_VERIFICATION = "INCOME_VERIFICATION"
      USER_INCOME_VERIFICATION = "USER_INCOME_VERIFICATION"
      INCOME_VERIFICATION_RISK_SIGNALS = "INCOME_VERIFICATION_RISK_SIGNALS"
      USER_INCOME_VERIFICATION_RISK_SIGNALS = "USER_INCOME_VERIFICATION_RISK_SIGNALS"
    end
  end
end
