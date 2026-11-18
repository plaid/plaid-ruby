# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CreditSessionBankIncomeStatus
      extend Plaid::Internal::Types::Enum

      APPROVED = "APPROVED"
      NO_DEPOSITS_FOUND = "NO_DEPOSITS_FOUND"
      USER_REPORTED_NO_INCOME = "USER_REPORTED_NO_INCOME"
      STARTED = "STARTED"
      INTERNAL_ERROR = "INTERNAL_ERROR"
    end
  end
end
