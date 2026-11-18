# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferAuthorizationDecisionRationaleCode
      extend Plaid::Internal::Types::Enum

      NSF = "NSF"
      RISK = "RISK"
      TRANSFER_LIMIT_REACHED = "TRANSFER_LIMIT_REACHED"
      MANUALLY_VERIFIED_ITEM = "MANUALLY_VERIFIED_ITEM"
      ITEM_LOGIN_REQUIRED = "ITEM_LOGIN_REQUIRED"
      PAYMENT_PROFILE_LOGIN_REQUIRED = "PAYMENT_PROFILE_LOGIN_REQUIRED"
      ERROR = "ERROR"
      MIGRATED_ACCOUNT_ITEM = "MIGRATED_ACCOUNT_ITEM"
      ADMIN = "ADMIN"
      FRAUD = "FRAUD"
    end
  end
end
