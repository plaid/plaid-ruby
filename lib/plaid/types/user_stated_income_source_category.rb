# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module UserStatedIncomeSourceCategory
      extend Plaid::Internal::Types::Enum

      OTHER = "OTHER"
      SALARY = "SALARY"
      UNEMPLOYMENT = "UNEMPLOYMENT"
      CASH = "CASH"
      GIG_ECONOMY = "GIG_ECONOMY"
      RENTAL = "RENTAL"
      CHILD_SUPPORT = "CHILD_SUPPORT"
      MILITARY = "MILITARY"
      RETIREMENT = "RETIREMENT"
      LONG_TERM_DISABILITY = "LONG_TERM_DISABILITY"
      BANK_INTEREST = "BANK_INTEREST"
    end
  end
end
