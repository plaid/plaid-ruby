# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsRulesRemoveResponse defines the response schema for `/beta/transactions/rules/v1/remove`
    class TransactionsRulesRemoveResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
