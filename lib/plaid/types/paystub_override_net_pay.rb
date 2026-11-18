# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing information about the net pay amount on the paystub.
    class PaystubOverrideNetPay < Internal::Types::Model
      field :description, -> { String }, optional: true, nullable: true

      field :currency, -> { String }, optional: true, nullable: true

      field :ytd_amount, -> { Float }, optional: true, nullable: true
    end
  end
end
