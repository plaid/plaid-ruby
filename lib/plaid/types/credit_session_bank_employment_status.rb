# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CreditSessionBankEmploymentStatus
      extend Plaid::Internal::Types::Enum

      APPROVED = "APPROVED"
      NO_EMPLOYERS_FOUND = "NO_EMPLOYERS_FOUND"
      EMPLOYER_NOT_LISTED = "EMPLOYER_NOT_LISTED"
      STARTED = "STARTED"
      INTERNAL_ERROR = "INTERNAL_ERROR"
    end
  end
end
