# frozen_string_literal: true

module Plaid
  module Wallet
    module Types
      class WalletTransactionListRequest < Internal::Types::Model
        field :wallet_id, -> { String }, optional: false, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false

        field :count, -> { Integer }, optional: true, nullable: false

        field :options, -> { Plaid::Types::WalletTransactionListRequestOptions }, optional: true, nullable: true
      end
    end
  end
end
