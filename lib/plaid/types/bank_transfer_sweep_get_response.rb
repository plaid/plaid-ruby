# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # BankTransferSweepGetResponse defines the response schema for `/bank_transfer/sweep/get`
    class BankTransferSweepGetResponse < Internal::Types::Model
      field :sweep, -> { Plaid::Types::BankTransferSweep }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
