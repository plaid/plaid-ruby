# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with the Income product. This field is required if
    # `income_verification` is included in the `products` array.
    class LinkTokenCreateRequestIncomeVerification < Internal::Types::Model
      field :income_verification_id, -> { String }, optional: true, nullable: false

      field :asset_report_id, -> { String }, optional: true, nullable: false

      field :access_tokens, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :income_source_types, -> { Internal::Types::Array[Plaid::Types::IncomeVerificationSourceType] }, optional: true, nullable: false

      field :bank_income, -> { Plaid::Types::LinkTokenCreateRequestIncomeVerificationBankIncome }, optional: true, nullable: false

      field :payroll_income, -> { Plaid::Types::LinkTokenCreateRequestIncomeVerificationPayrollIncome }, optional: true, nullable: false

      field :stated_income_sources, -> { Internal::Types::Array[Plaid::Types::LinkTokenCreateRequestUserStatedIncomeSource] }, optional: true, nullable: false
    end
  end
end
