# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentConsentPeriodicAlignment
      extend Plaid::Internal::Types::Enum

      CALENDAR = "CALENDAR"
      CONSENT = "CONSENT"
    end
  end
end
