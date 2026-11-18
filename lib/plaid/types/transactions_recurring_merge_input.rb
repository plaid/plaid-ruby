# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsRecurringMergeInput defines a single input to the `/transactions/recurring/streams/merge` endpoint.
    class TransactionsRecurringMergeInput < Internal::Types::Model
      field :stream_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
