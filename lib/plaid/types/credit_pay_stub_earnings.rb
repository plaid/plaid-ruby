# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing both a breakdown of earnings on a pay stub and the total earnings.
    class CreditPayStubEarnings < Internal::Types::Model
      field :breakdown, -> { Internal::Types::Array[Plaid::Types::PayStubEarningsBreakdown] }, optional: false, nullable: false

      field :total, -> { Plaid::Types::PayStubEarningsTotal }, optional: false, nullable: false
    end
  end
end
