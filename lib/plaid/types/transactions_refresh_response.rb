# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsRefreshResponse defines the response schema for `/transactions/refresh`
    class TransactionsRefreshResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
