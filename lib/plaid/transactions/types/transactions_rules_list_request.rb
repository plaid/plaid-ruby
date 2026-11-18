# frozen_string_literal: true

module Plaid
  module Transactions
    module Types
      class TransactionsRulesListRequest < Internal::Types::Model
        field :client_user_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
