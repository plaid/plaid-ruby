# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/bank_transfer/balance/get`
    class BankTransferBalanceGetResponse < Internal::Types::Model
      field :balance, -> { Plaid::Types::BankTransferBalance }, optional: false, nullable: false

      field :origination_account_id, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
