# frozen_string_literal: true

module Plaid
  module IncomeVerification
    module Types
      class IncomeVerificationPrecheckRequest < Internal::Types::Model
        field :user, -> { Plaid::Types::IncomeVerificationPrecheckUser }, optional: true, nullable: true

        field :employer, -> { Plaid::Types::IncomeVerificationPrecheckEmployer }, optional: true, nullable: true

        field :payroll_institution, -> { Plaid::Types::IncomeVerificationPrecheckPayrollInstitution }, optional: true, nullable: true

        field :transactions_access_token, -> { String }, optional: true, nullable: true

        field :transactions_access_tokens, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :us_military_info, -> { Plaid::Types::IncomeVerificationPrecheckMilitaryInfo }, optional: true, nullable: true
      end
    end
  end
end
