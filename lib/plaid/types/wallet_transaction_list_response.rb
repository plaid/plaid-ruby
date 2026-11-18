# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # WalletTransactionListResponse defines the response schema for `/wallet/transaction/list`
    class WalletTransactionListResponse < Internal::Types::Model
      field :transactions, -> { Internal::Types::Array[Plaid::Types::WalletTransaction] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
