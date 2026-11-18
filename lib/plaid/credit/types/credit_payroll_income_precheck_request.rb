# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class CreditPayrollIncomePrecheckRequest < Internal::Types::Model
        field :user_token, -> { String }, optional: true, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :access_tokens, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :employer, -> { Plaid::Types::IncomeVerificationPrecheckEmployer }, optional: true, nullable: true

        field :us_military_info, -> { Plaid::Types::IncomeVerificationPrecheckMilitaryInfo }, optional: true, nullable: true

        field :payroll_institution, -> { Plaid::Types::IncomeVerificationPrecheckPayrollInstitution }, optional: true, nullable: true
      end
    end
  end
end
