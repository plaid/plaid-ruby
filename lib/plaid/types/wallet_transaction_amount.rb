# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The amount and currency of a transaction
    class WalletTransactionAmount < Internal::Types::Model
      field :iso_currency_code, -> { Plaid::Types::WalletIsoCurrencyCode }, optional: false, nullable: false

      field :value, -> { Float }, optional: false, nullable: false
    end
  end
end
