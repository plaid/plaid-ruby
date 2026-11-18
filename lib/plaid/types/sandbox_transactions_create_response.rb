# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxTransactionsCreateResponse defines the response schema for `/sandbox/transactions/create`
    class SandboxTransactionsCreateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
