# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxEventStatus
      extend Plaid::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      EXPIRED = "EXPIRED"
      REVOKED = "REVOKED"
      SUSPENDED = "SUSPENDED"
    end
  end
end
