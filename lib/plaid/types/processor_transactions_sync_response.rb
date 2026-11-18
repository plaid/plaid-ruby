# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorTransactionsSyncResponse defines the response schema for `/processor/transactions/sync`
    class ProcessorTransactionsSyncResponse < Internal::Types::Model
      field :transactions_update_status, -> { Plaid::Types::TransactionsUpdateStatus }, optional: false, nullable: false

      field :account, -> { Plaid::Types::AccountBaseNullable }, optional: false, nullable: true

      field :added, -> { Internal::Types::Array[Plaid::Types::Transaction] }, optional: false, nullable: false

      field :modified, -> { Internal::Types::Array[Plaid::Types::Transaction] }, optional: false, nullable: false

      field :removed, -> { Internal::Types::Array[Plaid::Types::RemovedTransaction] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
