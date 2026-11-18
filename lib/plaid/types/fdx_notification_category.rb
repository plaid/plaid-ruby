# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxNotificationCategory
      extend Plaid::Internal::Types::Enum

      SECURITY = "SECURITY"
      MAINTENANCE = "MAINTENANCE"
      FRAUD = "FRAUD"
      CONSENT = "CONSENT"
      NEW_DATA = "NEW_DATA"
      TOKENIZED_ACCOUNT_NUMBER = "TOKENIZED_ACCOUNT_NUMBER"
    end
  end
end
