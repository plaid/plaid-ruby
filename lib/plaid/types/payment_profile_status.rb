# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentProfileStatus
      extend Plaid::Internal::Types::Enum

      PENDING = "PENDING"
      READY = "READY"
      REMOVED = "REMOVED"
    end
  end
end
