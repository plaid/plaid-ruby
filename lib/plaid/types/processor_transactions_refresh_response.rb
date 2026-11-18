# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorTransactionsRefreshResponse defines the response schema for `/processor/transactions/refresh`
    class ProcessorTransactionsRefreshResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
