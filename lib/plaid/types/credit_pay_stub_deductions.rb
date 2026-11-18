# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object with the deduction information found on a pay stub.
    class CreditPayStubDeductions < Internal::Types::Model
      field :breakdown, -> { Internal::Types::Array[Plaid::Types::PayStubDeductionsBreakdown] }, optional: false, nullable: false

      field :total, -> { Plaid::Types::PayStubDeductionsTotal }, optional: false, nullable: false
    end
  end
end
