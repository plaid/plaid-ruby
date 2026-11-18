# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentInitiationConsentStatus
      extend Plaid::Internal::Types::Enum

      UNAUTHORISED = "UNAUTHORISED"
      AUTHORISED = "AUTHORISED"
      REVOKED = "REVOKED"
      REJECTED = "REJECTED"
      EXPIRED = "EXPIRED"
    end
  end
end
