# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LoanInterestRateType
      extend Plaid::Internal::Types::Enum

      FIXED = "fixed"
      VARIABLE = "variable"
    end
  end
end
