# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing both a breakdown of earnings on a paystub and the total earnings.
    class Earnings < Internal::Types::Model
      field :subtotals, -> { Internal::Types::Array[Plaid::Types::EarningsTotal] }, optional: true, nullable: false

      field :totals, -> { Internal::Types::Array[Plaid::Types::EarningsTotal] }, optional: true, nullable: false

      field :breakdown, -> { Internal::Types::Array[Plaid::Types::EarningsBreakdown] }, optional: true, nullable: false

      field :total, -> { Plaid::Types::EarningsTotal }, optional: true, nullable: false
    end
  end
end
