# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsRecurringUpdateResponse defines the response schema for the `/transactions/recurring/streams/update`
    # endpoint.
    class TransactionsRecurringUpdateResponse < Internal::Types::Model
      field :modified_streams, -> { Internal::Types::Array[Plaid::Types::TransactionStream] }, optional: false, nullable: false

      field :removed_stream_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
