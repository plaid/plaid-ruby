# frozen_string_literal: true

module Plaid
  module Transactions
    module Types
      class TransactionsGetRequest < Internal::Types::Model
        field :options, -> { Plaid::Types::TransactionsGetRequestOptions }, optional: true, nullable: false

        field :access_token, -> { String }, optional: false, nullable: false

        field :start_date, -> { String }, optional: false, nullable: false

        field :end_date, -> { String }, optional: false, nullable: false
      end
    end
  end
end
