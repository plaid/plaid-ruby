# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # BankTransferSweepListResponse defines the response schema for `/bank_transfer/sweep/list`
    class BankTransferSweepListResponse < Internal::Types::Model
      field :sweeps, -> { Internal::Types::Array[Plaid::Types::BankTransferSweep] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
