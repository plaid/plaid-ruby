# frozen_string_literal: true

module Plaid
  module Transactions
    module Types
      class TransactionsEnrichRequest < Internal::Types::Model
        field :account_type, -> { String }, optional: false, nullable: false

        field :transactions, -> { Internal::Types::Array[Plaid::Types::ClientProvidedTransaction] }, optional: false, nullable: false

        field :options, -> { Plaid::Types::TransactionsEnrichRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
