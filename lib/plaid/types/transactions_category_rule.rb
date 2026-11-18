# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A representation of a transactions category rule.
    class TransactionsCategoryRule < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false

      field :pfc_primary_category, -> { String }, optional: true, nullable: false

      field :pfc_detailed_category, -> { String }, optional: true, nullable: false

      field :rule_details, -> { Plaid::Types::TransactionsRuleDetails }, optional: true, nullable: false
    end
  end
end
