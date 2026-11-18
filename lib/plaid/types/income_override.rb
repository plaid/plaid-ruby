# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specify payroll data on the account.
    class IncomeOverride < Internal::Types::Model
      field :paystubs, -> { Internal::Types::Array[Plaid::Types::PaystubOverride] }, optional: true, nullable: false

      field :w2s, -> { Internal::Types::Array[Plaid::Types::W2Override] }, optional: true, nullable: false
    end
  end
end
