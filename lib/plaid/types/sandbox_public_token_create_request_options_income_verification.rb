# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A set of parameters for income verification options. This field is required if `income_verification` is included
    # in the `initial_products` array.
    class SandboxPublicTokenCreateRequestOptionsIncomeVerification < Internal::Types::Model
      field :income_source_types, -> { Internal::Types::Array[Plaid::Types::IncomeVerificationSourceType] }, optional: true, nullable: false

      field :bank_income, -> { Plaid::Types::SandboxPublicTokenCreateRequestIncomeVerificationBankIncome }, optional: true, nullable: false
    end
  end
end
