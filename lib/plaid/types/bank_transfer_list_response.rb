# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/bank_transfer/list`
    class BankTransferListResponse < Internal::Types::Model
      field :bank_transfers, -> { Internal::Types::Array[Plaid::Types::BankTransfer] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
