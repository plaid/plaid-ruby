# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing both a breakdown of earnings on a paystub and the total earnings.
    class PaystubOverrideEarnings < Internal::Types::Model
      field :breakdown, -> { Internal::Types::Array[Plaid::Types::PaystubOverrideEarningsBreakdown] }, optional: true, nullable: false

      field :total, -> { Plaid::Types::PaystubOverrideEarningsTotal }, optional: true, nullable: false
    end
  end
end
