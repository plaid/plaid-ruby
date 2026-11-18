# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CreditBankIncomeCategory
      extend Plaid::Internal::Types::Enum

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
      CASH_DEPOSIT = "CASH_DEPOSIT"
      TRANSFER_FROM_APPLICATION = "TRANSFER_FROM_APPLICATION"
      TAX_REFUND = "TAX_REFUND"
      BENEFIT_OTHER = "BENEFIT_OTHER"
      OTHER = "OTHER"
    end
  end
end
