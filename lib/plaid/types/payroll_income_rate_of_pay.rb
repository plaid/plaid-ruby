# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the rate at which an individual is paid.
    class PayrollIncomeRateOfPay < Internal::Types::Model
      field :pay_rate, -> { String }, optional: true, nullable: true

      field :pay_amount, -> { Float }, optional: true, nullable: true
    end
  end
end
