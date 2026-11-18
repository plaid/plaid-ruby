# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IdentityMatchListOutcome
      extend Plaid::Internal::Types::Enum

      PASS = "PASS"
      FAIL = "FAIL"
      UNKNOWN = "UNKNOWN"
    end
  end
end
