# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing information about the net pay amount on the paystub.
    class NetPay < Internal::Types::Model
      field :current_amount, -> { Float }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true

      field :ytd_amount, -> { Float }, optional: true, nullable: true

      field :total, -> { Plaid::Types::Total }, optional: true, nullable: false
    end
  end
end
