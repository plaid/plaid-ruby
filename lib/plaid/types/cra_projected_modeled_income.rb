# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Forward-looking modeled estimate of income based on recent income transactions and trends in active streams.
    class CraProjectedModeledIncome < Internal::Types::Model
      field :monthly, -> { Plaid::Types::CraMonthlyIncomeValues }, optional: false, nullable: false

      field :annual, -> { Plaid::Types::CraAnnualIncomeValues }, optional: false, nullable: false
    end
  end
end
