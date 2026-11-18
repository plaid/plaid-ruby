# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WalletIsoCurrencyCode
      extend Plaid::Internal::Types::Enum

      GBP = "GBP"
      EUR = "EUR"
    end
  end
end
