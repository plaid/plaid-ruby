# frozen_string_literal: true

module Plaid
  module Wallet
    module Types
      class WalletGetRequest < Internal::Types::Model
        field :wallet_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
