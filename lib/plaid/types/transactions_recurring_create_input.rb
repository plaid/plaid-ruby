# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsRecurringCreateInput defines a single input to the `/transactions/recurring/streams/create` endpoint.
    class TransactionsRecurringCreateInput < Internal::Types::Model
      field :transaction_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
