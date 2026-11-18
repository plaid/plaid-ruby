# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Modeled estimate of current income based on recently observed income transactions.
    class CraVerificationModeledIncome < Internal::Types::Model
      field :monthly, -> { Plaid::Types::CraVerificationIncomeValues }, optional: false, nullable: false

      field :annual, -> { Plaid::Types::CraVerificationIncomeValues }, optional: false, nullable: false
    end
  end
end
