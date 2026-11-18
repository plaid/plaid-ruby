# frozen_string_literal: true

module Plaid
  module Transactions
    module Types
      class TransactionsRulesCreateRequest < Internal::Types::Model
        field :client_user_id, -> { String }, optional: false, nullable: false

        field :pfc_primary_category, -> { String }, optional: false, nullable: false

        field :pfc_detailed_category, -> { String }, optional: false, nullable: false

        field :rule_details, -> { Plaid::Types::TransactionsRuleDetails }, optional: false, nullable: false
      end
    end
  end
end
