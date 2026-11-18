# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # How the data provider standardized and validated the submitted address. `null` when the provider returned neither
    # a validation level nor a standardized address. Only US addresses are validated, so this is always `null` when the
    # submitted address is outside the US.
    class BusinessAddressValidation < Internal::Types::Model
      field :level, -> { Plaid::Types::BusinessAddressValidationLevel }, optional: false, nullable: true

      field :standardized_address, -> { Plaid::Types::BusinessStandardizedAddress }, optional: false, nullable: true

      field :deliverability, -> { Plaid::Types::BusinessAddressDeliverabilityNullable }, optional: false, nullable: true
    end
  end
end
