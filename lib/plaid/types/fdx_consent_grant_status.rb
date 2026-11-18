# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxConsentGrantStatus
      extend Plaid::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      REVOKED = "REVOKED"
      EXPIRED = "EXPIRED"
    end
  end
end
