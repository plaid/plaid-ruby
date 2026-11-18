# frozen_string_literal: true

module Plaid
  module Wallet
    module Types
      class WalletCreateRequest < Internal::Types::Model
        field :iso_currency_code, -> { Plaid::Types::WalletIsoCurrencyCode }, optional: false, nullable: false
      end
    end
  end
end
