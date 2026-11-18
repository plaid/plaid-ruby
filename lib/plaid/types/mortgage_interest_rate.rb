# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object containing metadata about the interest rate for the mortgage.
    class MortgageInterestRate < Internal::Types::Model
      field :percentage, -> { Float }, optional: false, nullable: true

      field :type, -> { String }, optional: false, nullable: true
    end
  end
end
