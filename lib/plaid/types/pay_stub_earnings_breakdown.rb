# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the earnings line items for the pay period.
    class PayStubEarningsBreakdown < Internal::Types::Model
      field :canonical_description, -> { String }, optional: false, nullable: true

      field :current_amount, -> { Float }, optional: false, nullable: true

      field :description, -> { String }, optional: false, nullable: true

      field :hours, -> { Float }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :rate, -> { Float }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :ytd_amount, -> { Float }, optional: false, nullable: true
    end
  end
end
