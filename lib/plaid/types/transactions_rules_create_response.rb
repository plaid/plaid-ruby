# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsRulesCreateResponse defines the response schema for `/beta/transactions/rules/v1/create`
    class TransactionsRulesCreateResponse < Internal::Types::Model
      field :rule, -> { Plaid::Types::TransactionsCategoryRule }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
