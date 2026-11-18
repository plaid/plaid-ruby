# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # WalletTransactionListRequest defines the request schema for `/wallet/transaction/list`
    class WalletTransactionsListRequest < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false

      field :secret, -> { String }, optional: true, nullable: false

      field :wallet_id, -> { String }, optional: false, nullable: false

      field :cursor, -> { String }, optional: true, nullable: false

      field :count, -> { Integer }, optional: true, nullable: false

      field :options, -> { Plaid::Types::WalletTransactionListRequestOptions }, optional: true, nullable: true
    end
  end
end
