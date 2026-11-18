# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BusinessAddressValidationLevel
      extend Plaid::Internal::Types::Enum

      FULL = "full"
      PARTIAL = "partial"
      INVALID = "invalid"
    end
  end
end
