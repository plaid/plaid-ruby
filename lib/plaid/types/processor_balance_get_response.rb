# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorBalanceGetResponse defines the response schema for `/processor/balance/get`
    class ProcessorBalanceGetResponse < Internal::Types::Model
      field :account, -> { Plaid::Types::AccountBase }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
