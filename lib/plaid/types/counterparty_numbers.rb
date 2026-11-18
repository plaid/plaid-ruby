# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Account numbers associated with the counterparty, when available.
    # This field is currently only filled in for select financial institutions in Europe.
    class CounterpartyNumbers < Internal::Types::Model
      field :bacs, -> { Plaid::Types::CounterpartyNumbersBacs }, optional: true, nullable: true

      field :international, -> { Plaid::Types::CounterpartyNumbersInternational }, optional: true, nullable: true
    end
  end
end
