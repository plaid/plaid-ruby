# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsEnrichResponse defines the response schema for `/transactions/enrich`.
    class TransactionsEnrichResponse < Internal::Types::Model
      field :enriched_transactions, -> { Internal::Types::Array[Plaid::Types::ClientProvidedEnrichedTransaction] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
