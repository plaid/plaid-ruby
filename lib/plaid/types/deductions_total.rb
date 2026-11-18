# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the total deductions for the pay period
    class DeductionsTotal < Internal::Types::Model
      field :current_amount, -> { Float }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true

      field :ytd_amount, -> { Float }, optional: true, nullable: true
    end
  end
end
