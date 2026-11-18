# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object with the deduction information found on a paystub.
    class PaystubOverrideDeductions < Internal::Types::Model
      field :breakdown, -> { Internal::Types::Array[Plaid::Types::PaystubOverrideDeductionsBreakdown] }, optional: true, nullable: false

      field :total, -> { Plaid::Types::PaystubOverrideDeductionsTotal }, optional: true, nullable: false
    end
  end
end
