# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with Bank Income. This field is required if `income_verification`
    # is included in the `products` array and `bank` is specified in `income_source_types`.
    class LinkTokenCreateRequestIncomeVerificationBankIncome < Internal::Types::Model
      field :days_requested, -> { Integer }, optional: false, nullable: false

      field :enable_multiple_items, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
