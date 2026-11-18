# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing information about the net pay amount on the pay stub.
    class CreditPayStubNetPay < Internal::Types::Model
      field :current_amount, -> { Float }, optional: false, nullable: true

      field :description, -> { String }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :ytd_amount, -> { Float }, optional: false, nullable: true
    end
  end
end
