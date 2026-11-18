# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorTransactionsGetResponse defines the response schema for `/processor/transactions/get`
    class ProcessorTransactionsGetResponse < Internal::Types::Model
      field :account, -> { Plaid::Types::AccountBase }, optional: false, nullable: false

      field :transactions, -> { Internal::Types::Array[Plaid::Types::Transaction] }, optional: false, nullable: false

      field :total_transactions, -> { Integer }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
