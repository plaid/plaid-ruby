# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # WalletTransactionExecuteResponse defines the response schema for `/wallet/transaction/execute`
    class WalletTransactionExecuteResponse < Internal::Types::Model
      field :transaction_id, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::WalletTransactionStatus }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
