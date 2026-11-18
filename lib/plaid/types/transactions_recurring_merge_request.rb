# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsRecurringMergeRequest defines the request schema for `/transactions/recurring/streams/merge` endpoint.
    class TransactionsRecurringMergeRequest < Internal::Types::Model
      field :client_id, -> { String }, optional: true, nullable: false

      field :access_token, -> { String }, optional: false, nullable: false

      field :secret, -> { String }, optional: true, nullable: false

      field :inputs, -> { Internal::Types::Array[Plaid::Types::TransactionsRecurringMergeInput] }, optional: false, nullable: false
    end
  end
end
