# frozen_string_literal: true

module Plaid
  module Transactions
    module Types
      class TransactionsSyncRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false

        field :count, -> { Integer }, optional: true, nullable: false

        field :options, -> { Plaid::Types::TransactionsSyncRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
