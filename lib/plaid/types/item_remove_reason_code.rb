# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ItemRemoveReasonCode
      extend Plaid::Internal::Types::Enum

      FRAUD_FIRST_PARTY = "FRAUD_FIRST_PARTY"
      FRAUD_FALSE_IDENTITY = "FRAUD_FALSE_IDENTITY"
      FRAUD_ABUSE = "FRAUD_ABUSE"
      FRAUD_OTHER = "FRAUD_OTHER"
      CONNECTION_IS_NON_FUNCTIONAL = "CONNECTION_IS_NON_FUNCTIONAL"
      OTHER = "OTHER"
    end
  end
end
