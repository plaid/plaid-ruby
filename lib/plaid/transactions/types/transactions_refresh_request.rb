# frozen_string_literal: true

module Plaid
  module Transactions
    module Types
      class TransactionsRefreshRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
