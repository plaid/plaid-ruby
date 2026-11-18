# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The warning associated with the data that was unavailable for the Bank Income Report.
    class CreditBankIncomeWarning < Internal::Types::Model
      field :warning_type, -> { Plaid::Types::CreditBankIncomeWarningType }, optional: true, nullable: false

      field :warning_code, -> { Plaid::Types::CreditBankIncomeWarningCode }, optional: true, nullable: false

      field :cause, -> { Plaid::Types::CreditBankIncomeCause }, optional: true, nullable: false
    end
  end
end
