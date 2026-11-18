# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/sandbox/transfer/test_clock/list`
    class SandboxTransferTestClockListResponse < Internal::Types::Model
      field :test_clocks, -> { Internal::Types::Array[Plaid::Types::TransferTestClock] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
