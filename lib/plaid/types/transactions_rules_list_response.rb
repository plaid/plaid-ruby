# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsRulesListResponse defines the response schema for `/beta/transactions/rules/v1/list`
    class TransactionsRulesListResponse < Internal::Types::Model
      field :rules, -> { Internal::Types::Array[Plaid::Types::TransactionsCategoryRule] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
