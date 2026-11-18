# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxNotificationPayloadIDType
      extend Plaid::Internal::Types::Enum

      ACCOUNT = "ACCOUNT"
      CUSTOMER = "CUSTOMER"
      PARTY = "PARTY"
      MAINTENANCE = "MAINTENANCE"
      CONSENT = "CONSENT"
    end
  end
end
