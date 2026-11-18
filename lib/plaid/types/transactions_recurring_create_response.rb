# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsRecurringCreateResponse defines the response schema for the `/transactions/recurring/streams/create`
    # endpoint.
    class TransactionsRecurringCreateResponse < Internal::Types::Model
      field :added_streams, -> { Internal::Types::Array[Plaid::Types::TransactionStream] }, optional: false, nullable: false

      field :modified_streams, -> { Internal::Types::Array[Plaid::Types::TransactionStream] }, optional: true, nullable: false

      field :removed_stream_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
