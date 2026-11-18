# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsGetResponse defines the response schema for `/transactions/get`
    class TransactionsGetResponse < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::AccountBase] }, optional: false, nullable: false

      field :transactions, -> { Internal::Types::Array[Plaid::Types::Transaction] }, optional: false, nullable: false

      field :total_transactions, -> { Integer }, optional: false, nullable: false

      field :item, -> { Plaid::Types::Item }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
