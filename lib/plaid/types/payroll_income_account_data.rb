# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing account level data.
    class PayrollIncomeAccountData < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: true

      field :rate_of_pay, -> { Plaid::Types::PayrollIncomeRateOfPay }, optional: false, nullable: false

      field :pay_frequency, -> { String }, optional: false, nullable: true
    end
  end
end
