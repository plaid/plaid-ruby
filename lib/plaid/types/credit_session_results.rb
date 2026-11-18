# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The set of results for a Link session.
    class CreditSessionResults < Internal::Types::Model
      field :item_add_results, -> { Internal::Types::Array[Plaid::Types::CreditSessionItemAddResult] }, optional: true, nullable: false

      field :bank_income_results, -> { Internal::Types::Array[Plaid::Types::CreditSessionBankIncomeResult] }, optional: true, nullable: false

      field :bank_employment_results, -> { Internal::Types::Array[Plaid::Types::CreditSessionBankEmploymentResult] }, optional: true, nullable: false

      field :payroll_income_results, -> { Internal::Types::Array[Plaid::Types::CreditSessionPayrollIncomeResult] }, optional: true, nullable: false

      field :document_income_results, -> { Plaid::Types::CreditSessionDocumentIncomeResult }, optional: true, nullable: true
    end
  end
end
