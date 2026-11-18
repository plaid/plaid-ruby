# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with Bank Employment. This field is required if `employment` is
    # included in the `products` array and `bank` is specified in `employment_source_types`.
    class LinkTokenCreateRequestEmploymentBankIncome < Internal::Types::Model
      field :days_requested, -> { Integer }, optional: false, nullable: false
    end
  end
end
