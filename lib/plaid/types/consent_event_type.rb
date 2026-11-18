# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ConsentEventType
      extend Plaid::Internal::Types::Enum

      CONSENT_GRANTED = "CONSENT_GRANTED"
      CONSENT_REVOKED = "CONSENT_REVOKED"
      CONSENT_UPDATED = "CONSENT_UPDATED"
    end
  end
end
