# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object with the deduction information found on a paystub.
    class Deductions < Internal::Types::Model
      field :subtotals, -> { Internal::Types::Array[Plaid::Types::Total] }, optional: true, nullable: false

      field :breakdown, -> { Internal::Types::Array[Plaid::Types::DeductionsBreakdown] }, optional: false, nullable: false

      field :totals, -> { Internal::Types::Array[Plaid::Types::Total] }, optional: true, nullable: false

      field :total, -> { Plaid::Types::DeductionsTotal }, optional: false, nullable: false
    end
  end
end
