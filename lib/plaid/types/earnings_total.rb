# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing both the current pay period and year to date amount for an earning category.
    class EarningsTotal < Internal::Types::Model
      field :current_amount, -> { Float }, optional: true, nullable: true

      field :current_pay, -> { Plaid::Types::Pay }, optional: true, nullable: false

      field :ytd_pay, -> { Plaid::Types::Pay }, optional: true, nullable: false

      field :hours, -> { Float }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true

      field :ytd_amount, -> { Float }, optional: true, nullable: true
    end
  end
end
