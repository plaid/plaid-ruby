# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing both the current pay period and year to date amount for an earning category.
    class PaystubOverrideEarningsTotal < Internal::Types::Model
      field :hours, -> { Float }, optional: true, nullable: true

      field :currency, -> { String }, optional: true, nullable: true

      field :ytd_amount, -> { Float }, optional: true, nullable: true
    end
  end
end
