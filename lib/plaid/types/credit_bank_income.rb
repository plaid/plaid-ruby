# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The report of the Bank Income data for an end user.
    class CreditBankIncome < Internal::Types::Model
      field :bank_income_id, -> { String }, optional: true, nullable: false

      field :generated_time, -> { String }, optional: true, nullable: false

      field :days_requested, -> { Integer }, optional: true, nullable: false

      field :items, -> { Internal::Types::Array[Plaid::Types::CreditBankIncomeItem] }, optional: true, nullable: false

      field :bank_income_summary, -> { Plaid::Types::CreditBankIncomeSummary }, optional: true, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::CreditBankIncomeWarning] }, optional: true, nullable: false
    end
  end
end
