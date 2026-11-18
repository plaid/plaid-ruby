# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/sandbox/transfer/sweep/simulate`
    class SandboxTransferSweepSimulateResponse < Internal::Types::Model
      field :sweep, -> { Plaid::Types::SimulatedTransferSweep }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
