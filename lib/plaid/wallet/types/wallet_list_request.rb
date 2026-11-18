# frozen_string_literal: true

module Plaid
  module Wallet
    module Types
      class WalletListRequest < Internal::Types::Model
        field :iso_currency_code, -> { Plaid::Types::WalletIsoCurrencyCode }, optional: true, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false

        field :count, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
