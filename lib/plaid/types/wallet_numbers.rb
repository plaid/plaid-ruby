# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the e-wallet account numbers
    class WalletNumbers < Internal::Types::Model
      field :bacs, -> { Plaid::Types::RecipientBacsInResponse }, optional: true, nullable: true

      field :international, -> { Plaid::Types::NumbersInternationalIban }, optional: true, nullable: true
    end
  end
end
