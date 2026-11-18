# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the interest rate on a loan or line of credit.
    class LoanInterestRate < Internal::Types::Model
      field :percentage, -> { Float }, optional: false, nullable: true

      field :type, -> { Plaid::Types::LoanInterestRateType }, optional: false, nullable: true
    end
  end
end
