# frozen_string_literal: true

module Plaid
  module Wallet
    module Types
      class WalletTransactionExecuteRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false

        field :wallet_id, -> { String }, optional: false, nullable: false

        field :counterparty, -> { Plaid::Types::WalletTransactionCounterparty }, optional: false, nullable: false

        field :amount, -> { Plaid::Types::WalletTransactionAmount }, optional: false, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :reference, -> { String }, optional: false, nullable: false

        field :originating_fund_source, -> { Plaid::Types::OriginatingFundSource }, optional: true, nullable: true
      end
    end
  end
end
