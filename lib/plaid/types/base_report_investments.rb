# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A set of fields describing the investments data on an account. Its arrays may be empty.
    class BaseReportInvestments < Internal::Types::Model
      field :holdings, -> { Internal::Types::Array[Plaid::Types::BaseReportInvestmentHolding] }, optional: false, nullable: false

      field :securities, -> { Internal::Types::Array[Plaid::Types::BaseReportInvestmentSecurity] }, optional: false, nullable: false

      field :investment_transactions, -> { Internal::Types::Array[Plaid::Types::BaseReportInvestmentTransaction] }, optional: false, nullable: false
    end
  end
end
