# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the earnings line items for the pay period.
    class PaystubOverrideEarningsBreakdown < Internal::Types::Model
      field :canonical_description, -> { Plaid::Types::EarningsBreakdownCanonicalDescription }, optional: true, nullable: true

      field :current_amount, -> { Float }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: true

      field :hours, -> { Float }, optional: true, nullable: true

      field :currency, -> { String }, optional: true, nullable: true

      field :rate, -> { Float }, optional: true, nullable: true

      field :ytd_amount, -> { Float }, optional: true, nullable: true
    end
  end
end
