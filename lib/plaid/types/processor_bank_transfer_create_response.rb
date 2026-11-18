# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/processor/bank_transfer/create`
    class ProcessorBankTransferCreateResponse < Internal::Types::Model
      field :bank_transfer, -> { Plaid::Types::BankTransfer }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
