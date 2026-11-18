# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A set of fields describing the investments data on an account.
    class AssetReportInvestments < Internal::Types::Model
      field :holdings, -> { Internal::Types::Array[Plaid::Types::AssetReportInvestmentHolding] }, optional: false, nullable: false

      field :securities, -> { Internal::Types::Array[Plaid::Types::AssetReportInvestmentSecurity] }, optional: false, nullable: false

      field :transactions, -> { Internal::Types::Array[Plaid::Types::AssetReportInvestmentTransaction] }, optional: false, nullable: false
    end
  end
end
