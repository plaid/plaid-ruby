# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BaseReportWarningCode
      extend Plaid::Internal::Types::Enum

      IDENTITY_UNAVAILABLE = "IDENTITY_UNAVAILABLE"
      TRANSACTIONS_UNAVAILABLE = "TRANSACTIONS_UNAVAILABLE"
      USER_FRAUD_ALERT = "USER_FRAUD_ALERT"
    end
  end
end
