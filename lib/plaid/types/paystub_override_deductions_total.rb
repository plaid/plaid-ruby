# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the total deductions for the pay period
    class PaystubOverrideDeductionsTotal < Internal::Types::Model
      field :current_amount, -> { Float }, optional: true, nullable: true

      field :currency, -> { String }, optional: true, nullable: true

      field :ytd_amount, -> { Float }, optional: true, nullable: true
    end
  end
end
