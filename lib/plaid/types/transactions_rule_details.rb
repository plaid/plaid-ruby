# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A representation of transactions rule details.
    class TransactionsRuleDetails < Internal::Types::Model
      field :field, -> { Plaid::Types::TransactionsRuleField }, optional: false, nullable: false

      field :type, -> { Plaid::Types::TransactionsRuleType }, optional: false, nullable: false

      field :query, -> { String }, optional: false, nullable: false
    end
  end
end
