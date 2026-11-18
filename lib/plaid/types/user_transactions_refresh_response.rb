# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserTransactionsRefreshResponse defines the response schema for `/user/transactions/refresh`
    class UserTransactionsRefreshResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: true, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :results, -> { Internal::Types::Array[Plaid::Types::RefreshResult] }, optional: true, nullable: false
    end
  end
end
