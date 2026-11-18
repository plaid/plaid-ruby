# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # WalletListResponse defines the response schema for `/wallet/list`
    class WalletListResponse < Internal::Types::Model
      field :wallets, -> { Internal::Types::Array[Plaid::Types::Wallet] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
