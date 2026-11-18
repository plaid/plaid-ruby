# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with the Employment product. This field is required if
    # `employment` is included in the `products` array.
    class LinkTokenCreateRequestEmployment < Internal::Types::Model
      field :employment_source_types, -> { Internal::Types::Array[Plaid::Types::EmploymentSourceType] }, optional: true, nullable: false

      field :bank_employment, -> { Plaid::Types::LinkTokenCreateRequestEmploymentBankIncome }, optional: true, nullable: false
    end
  end
end
