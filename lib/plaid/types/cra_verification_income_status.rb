# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraVerificationIncomeStatus
      extend Plaid::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      INACTIVE = "INACTIVE"
      UNKNOWN = "UNKNOWN"
    end
  end
end
