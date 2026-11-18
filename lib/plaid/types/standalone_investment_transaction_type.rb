# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Valid values for investment transaction types and subtypes. Note that transactions representing inflow of cash
    # will appear as negative amounts, outflow of cash will appear as positive amounts.
    class StandaloneInvestmentTransactionType < Internal::Types::Model
      field :buy, -> { String }, optional: false, nullable: false

      field :sell, -> { String }, optional: false, nullable: false

      field :cancel, -> { String }, optional: false, nullable: false

      field :cash, -> { String }, optional: false, nullable: false

      field :fee, -> { String }, optional: false, nullable: false

      field :transfer, -> { String }, optional: false, nullable: false
    end
  end
end
