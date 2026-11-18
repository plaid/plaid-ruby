# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The warning associated with the data that was unavailable.
    class CraBankIncomeWarning < Internal::Types::Model
      field :warning_type, -> { Plaid::Types::CreditBankIncomeWarningType }, optional: true, nullable: false

      field :warning_code, -> { Plaid::Types::CraBankIncomeWarningCode }, optional: true, nullable: false

      field :cause, -> { Plaid::Types::CraBankIncomeCause }, optional: true, nullable: false
    end
  end
end
