# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configuration parameters for the Investments product
    class LinkTokenInvestments < Internal::Types::Model
      field :allow_unverified_crypto_wallets, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :allow_manual_entry, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :async_update, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
