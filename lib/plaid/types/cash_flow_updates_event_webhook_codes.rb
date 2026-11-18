# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CashFlowUpdatesEventWebhookCodes
      extend Plaid::Internal::Types::Enum

      LARGE_DEPOSIT_DETECTED = "LARGE_DEPOSIT_DETECTED"
      LOW_BALANCE_DETECTED = "LOW_BALANCE_DETECTED"
      NEW_LOAN_PAYMENT_DETECTED = "NEW_LOAN_PAYMENT_DETECTED"
      NSF_OVERDRAFT_DETECTED = "NSF_OVERDRAFT_DETECTED"
    end
  end
end
