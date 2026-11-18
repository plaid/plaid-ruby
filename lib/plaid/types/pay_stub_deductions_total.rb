# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the total deductions for the pay period
    class PayStubDeductionsTotal < Internal::Types::Model
      field :current_amount, -> { Float }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :ytd_amount, -> { Float }, optional: false, nullable: true
    end
  end
end
