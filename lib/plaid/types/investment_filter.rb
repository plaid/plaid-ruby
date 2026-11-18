# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A filter to apply to `investment`-type accounts (or `brokerage`-type accounts for API versions 2018-05-22 and
    # earlier).
    class InvestmentFilter < Internal::Types::Model
      field :account_subtypes, -> { Internal::Types::Array[Plaid::Types::InvestmentAccountSubtype] }, optional: false, nullable: false
    end
  end
end
