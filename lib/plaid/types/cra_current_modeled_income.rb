# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Modeled estimate of current income based on recently observed income transactions.
    class CraCurrentModeledIncome < Internal::Types::Model
      field :monthly, -> { Plaid::Types::CraMonthlyIncomeValues }, optional: false, nullable: false

      field :annual, -> { Plaid::Types::CraAnnualIncomeValues }, optional: false, nullable: false
    end
  end
end
