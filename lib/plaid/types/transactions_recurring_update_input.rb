# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsRecurringUpdateInput defines a single operation to the `/transactions/recurring/streams/update`
    # endpoint.
    class TransactionsRecurringUpdateInput < Internal::Types::Model
      field :stream_id, -> { String }, optional: false, nullable: false

      field :transaction_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
