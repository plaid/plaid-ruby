# frozen_string_literal: true

module Plaid
  module Wallet
    module Types
      class WalletTransactionGetRequest < Internal::Types::Model
        field :transaction_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
