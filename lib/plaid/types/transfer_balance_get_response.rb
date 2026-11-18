# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/balance/get`
    class TransferBalanceGetResponse < Internal::Types::Model
      field :balance, -> { Plaid::Types::TransferBalance }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
