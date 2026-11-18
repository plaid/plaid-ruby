# frozen_string_literal: true

module Plaid
  module Transactions
    module Types
      class TransactionsRecurringGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::TransactionsRecurringGetRequestOptions }, optional: true, nullable: false

        field :account_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      end
    end
  end
end
