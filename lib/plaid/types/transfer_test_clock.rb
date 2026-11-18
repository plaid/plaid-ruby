# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the test clock for a transfer.
    class TransferTestClock < Internal::Types::Model
      field :test_clock_id, -> { String }, optional: false, nullable: false

      field :virtual_time, -> { String }, optional: false, nullable: false
    end
  end
end
