# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for Bank Income. This field is required if `income_verification` is included in the
    # `initial_products` array and `bank` is specified in `income_source_types`.
    class SandboxPublicTokenCreateRequestIncomeVerificationBankIncome < Internal::Types::Model
      field :days_requested, -> { Integer }, optional: true, nullable: false
    end
  end
end
