# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The warning associated with the data that was unavailable for the Bank Employment Report.
    class CreditBankEmploymentWarning < Internal::Types::Model
      field :warning_type, -> { Plaid::Types::CreditBankEmploymentWarningType }, optional: false, nullable: false

      field :warning_code, -> { Plaid::Types::CreditBankIncomeWarningCode }, optional: false, nullable: false

      field :cause, -> { Plaid::Types::CreditBankIncomeCause }, optional: false, nullable: false
    end
  end
end
