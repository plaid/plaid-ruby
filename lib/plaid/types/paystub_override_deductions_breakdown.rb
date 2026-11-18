# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the deduction line items for the pay period
    class PaystubOverrideDeductionsBreakdown < Internal::Types::Model
      field :current_amount, -> { Float }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: true

      field :currency, -> { String }, optional: true, nullable: true

      field :ytd_amount, -> { Float }, optional: true, nullable: true
    end
  end
end
