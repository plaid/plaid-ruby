# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CreditBankIncomeWarningType
      extend Plaid::Internal::Types::Enum

      BANK_INCOME_WARNING = "BANK_INCOME_WARNING"
    end
  end
end
