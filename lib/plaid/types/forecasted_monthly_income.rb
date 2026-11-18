# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the predicted average monthly net income amount. This amount reflects the funds deposited
    # into the account and may not include any withheld income such as taxes or other payroll deductions
    class ForecastedMonthlyIncome < Internal::Types::Model
      field :baseline_amount, -> { Float }, optional: true, nullable: true

      field :current_amount, -> { Float }, optional: false, nullable: false
    end
  end
end
