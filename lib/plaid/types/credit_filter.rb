# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A filter to apply to `credit`-type accounts
    class CreditFilter < Internal::Types::Model
      field :account_subtypes, -> { Internal::Types::Array[Plaid::Types::CreditAccountSubtype] }, optional: false, nullable: false
    end
  end
end
