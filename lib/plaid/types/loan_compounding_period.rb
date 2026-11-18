# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LoanCompoundingPeriod
      extend Plaid::Internal::Types::Enum

      DAILY = "daily"
      WEEKLY = "weekly"
      BIWEEKLY = "biweekly"
      SEMIMONTHLY = "semimonthly"
      MONTHLY = "monthly"
      SEMIANNUALLY = "semiannually"
      ANNUALLY = "annually"
    end
  end
end
