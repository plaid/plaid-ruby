# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Identifying information for transferring holdings to an investment account.
    class InvestmentsAuthGetNumbers < Internal::Types::Model
      field :acats, -> { Internal::Types::Array[Plaid::Types::NumbersAcats] }, optional: true, nullable: false

      field :aton, -> { Internal::Types::Array[Plaid::Types::NumbersAton] }, optional: true, nullable: false

      field :retirement401k, -> { Internal::Types::Array[Plaid::Types::NumbersRetirement401K] }, optional: true, nullable: false, api_name: "retirement_401k"
    end
  end
end
