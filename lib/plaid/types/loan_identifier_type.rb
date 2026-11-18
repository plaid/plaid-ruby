# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LoanIdentifierType
      extend Plaid::Internal::Types::Enum

      LENDER_LOAN = "LenderLoan"
      UNIVERSAL_LOAN = "UniversalLoan"
    end
  end
end
